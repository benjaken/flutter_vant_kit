import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/field.dart';
import 'package:flutter_vant_kit/widgets/button.dart';

class Coupon {
  // 当前选中优惠券的索引
  final int? chosenCoupon;
  // 可用优惠券列表
  final List<CoupenItem>? coupons;
  // 不可用优惠券列表
  final List<CoupenItem>? disabledCoupons;
  // 可用优惠券列表标题
  final String enabledTitle;
  // 不可用优惠券列表标题
  final String disabledTitle;
  // 兑换按钮文字
  final String exchangeButtonText;
  // 是否禁用兑换按钮
  final bool exchangeButtonDisabled;
  // 兑换码最大长度
  final int exchangeMaxLength;
  // 滚动至特定优惠券位置
  final int? displayedCouponIndex;
  // 是否显示列表底部按钮
  final bool showCloseButton;
  // 列表底部按钮文字
  final String closeButtonText;
  // 输入框文字提示
  final String inputPlaceholder;
  // 是否展示兑换栏
  final bool showExchangeBar;
  // 列表为空时的占位图
  final Image? emptyImage;
  // 优惠券切换回调
  final Function(int val)? onSelect;
  // 兑换优惠券回调
  final Function(String val)? onExchange;

  Coupon({
    Key? key,
    this.chosenCoupon,
    this.coupons,
    this.disabledCoupons,
    this.enabledTitle: "可使用优惠券",
    this.disabledTitle: "不可使用优惠券",
    this.exchangeButtonText: "兑换",
    this.exchangeButtonDisabled: false,
    this.exchangeMaxLength: 10,
    this.displayedCouponIndex,
    this.showCloseButton: true,
    this.closeButtonText: "不使用优惠",
    this.inputPlaceholder: "请输入优惠码",
    this.showExchangeBar: true,
    this.emptyImage,
    this.onSelect,
    this.onExchange,
  });

  show(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CouponState(this);
        });
  }
}

class CouponState extends StatefulWidget {
  final Coupon coupon;

  const CouponState(this.coupon);

  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<CouponState>
    with SingleTickerProviderStateMixin {
  TextEditingController searchInput = TextEditingController();
  TabController? _tabController;
  ScrollController _scrollController = new ScrollController();
  int? _chosenCoupon;
  late List<CoupenItem> _coupons;
  late List<CoupenItem> _disabledCoupons;
  Coupon? couponWidget;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    couponWidget = widget.coupon;
    print(couponWidget);
    _coupons = couponWidget!.coupons ?? [];
    _disabledCoupons = couponWidget!.disabledCoupons ?? [];
    _chosenCoupon = couponWidget!.chosenCoupon;
    WidgetsBinding.instance!.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  void _onLayoutDone(_) {
    int? scrollIndex = couponWidget!.displayedCouponIndex ?? _chosenCoupon;
    if (scrollIndex != null && scrollIndex > 2) {
      int couponsLength = _coupons.length;
      int prevIndex = (scrollIndex > (couponsLength - 2)
              ? couponsLength - 2
              : scrollIndex) -
          1;
      double index = ((150 * prevIndex) + Style.paddingMd).toDouble();
      double maxScroll = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(index > maxScroll ? maxScroll : index,
          duration: Style.animationDurationFast, curve: Curves.ease);
    }
  }

  @override
  void dispose() {
    if (_tabController != null) _tabController!.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget buildSearchField() {
    return Field(
      placeholder: couponWidget!.inputPlaceholder,
      controller: searchInput,
      maxLength: couponWidget!.exchangeMaxLength,
      onChange: (val) {
        setState(() {
          searchInput.text = val;
        });
      },
      right: NButton(
        text: couponWidget!.exchangeButtonText,
        size: "small",
        type: "info",
        disabled:
            couponWidget!.exchangeButtonDisabled || searchInput.text == '',
        width: Style.couponListExchangeButtonWidth,
        onClick: () {
          if (couponWidget!.onExchange != null)
            couponWidget!.onExchange!(searchInput.text);
        },
      ),
    );
  }

  Widget buildEmptyList() {
    return Column(
      children: <Widget>[
        Image.network("https://img.yzcdn.cn/vant/coupon-empty.png",
            width: Style.couponListEmptyImageSize),
        SizedBox(width: Style.paddingSm),
        Text("暂无优惠券",
            style: TextStyle(
                color: Style.couponListEmptyTipColor,
                fontSize: Style.couponListEmptyTipFontSize))
      ],
    );
  }

  Widget buildTabBar() {
    return Container(
      decoration: BoxDecoration(
          color: Style.couponListTabBackground,
          border: Border(
              top: BorderSide(
                  width: Style.borderWidthBase, color: Style.borderColor))),
      child: TabBar(
          tabs: <Widget>[
            Tab(text: "${couponWidget!.enabledTitle}（${_coupons.length}）"),
            Tab(
                text:
                    "${couponWidget!.disabledTitle}（${_disabledCoupons.length}）"),
          ],
          controller: _tabController,
          indicatorColor: Style.couponListTabIndicatorColor,
          labelColor: Style.couponListTabLabelColor,
          unselectedLabelColor: Style.couponListTabUnselectedLabelColor),
    );
  }

  Widget buildCouponContainerLeft(CoupenItem coupon, int i, bool disabled) {
    return Container(
      width: Style.couponHeadWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: Style.intervalSm),
            height: Style.couponHeadHeight,
            child: Row(
              textBaseline: TextBaseline.ideographic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: <Widget>[
                Text("${coupon.valueDesc ?? ''}",
                    style: TextStyle(
                        fontSize: Style.couponNameFontSize,
                        fontWeight: Style.fontWeightBold,
                        color: disabled
                            ? Style.couponDisabledTextColor
                            : Style.couponAmountColor)),
                SizedBox(
                  width: Style.intervalSm,
                ),
                Text("${coupon.unitDesc ?? ''}",
                    style: TextStyle(
                        fontSize: Style.couponFontSize,
                        fontWeight: Style.fontWeightBold,
                        color: disabled
                            ? Style.couponDisabledTextColor
                            : Style.couponAmountColor)),
              ],
            ),
          ),
          Text("${coupon.condition ?? ''}",
              style: TextStyle(
                  fontSize: Style.couponFontSize, color: Style.couponColor))
        ],
      ),
    );
  }

  Widget buildCouponContainerRight(CoupenItem coupon, int i, bool disabled) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Style.couponHeadHeight,
            margin: EdgeInsets.only(bottom: Style.intervalSm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("${coupon.name ?? ''}",
                    style: TextStyle(
                        fontWeight: Style.fontWeightBold,
                        color: disabled
                            ? Style.couponDisabledTextColor
                            : Style.couponNameColor,
                        fontSize: Style.couponNameFontSize)),
                disabled
                    ? Container()
                    : Icon(Icons.check_circle,
                        color: i == _chosenCoupon && !disabled
                            ? Style.couponIconSelectedColor
                            : Style.transparent,
                        size: Style.couponIconSize),
              ],
            ),
          ),
          Text("有效期：${coupon.startAt ?? 'null'} - ${coupon.endAt ?? 'null'}",
              style: TextStyle(
                  color: Style.couponColor, fontSize: Style.couponFontSize))
        ],
      ),
    );
  }

  Widget buildCouponContainer(CoupenItem coupon, int i, bool disabled) {
    return Container(
      padding: Style.couponContentPadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildCouponContainerLeft(coupon, i, disabled),
          buildCouponContainerRight(coupon, i, disabled),
        ],
      ),
    );
  }

  Widget buildDescription(CoupenItem coupon, int i, bool disabled) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: Style.borderWidthBase, color: Style.borderColor)),
          color: Style.couponDescriptionBackgroundColor),
      padding: Style.couponDescriptionPadding,
      child: Text("${disabled ? coupon.reason : coupon.description}",
          style: TextStyle(
              color: Style.couponDescriptionColor,
              fontSize: Style.couponDescriptionFontSize)),
    );
  }

  Widget buildCoupon(int i, bool disabled) {
    CoupenItem coupon = disabled ? _disabledCoupons[i] : _coupons[i];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Style.couponBorderRadius),
          border: Border.all(
              width: Style.borderWidthBase, color: Style.borderColor),
          color: Style.couponBackgroundColor,
          boxShadow: [Style.couponBoxShadow]),
      margin: Style.couponMargin,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Style.couponBackgroundColor),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                  focusColor: disabled
                      ? Style.transparent
                      : Theme.of(context).focusColor,
                  highlightColor: disabled
                      ? Style.transparent
                      : Theme.of(context).highlightColor,
                  hoverColor: disabled
                      ? Style.transparent
                      : Theme.of(context).hoverColor,
                  splashColor: disabled
                      ? Style.transparent
                      : Theme.of(context).splashColor,
                  onTap: () {
                    setState(() {
                      if (disabled) return;
                      _chosenCoupon = i;
                      if (couponWidget!.onSelect != null)
                        couponWidget!.onSelect!(i);
                      Navigator.of(context).pop();
                    });
                  },
                  child: buildCouponContainer(coupon, i, disabled)),
            ),
          ),
          (coupon.reason != null || coupon.description != null)
              ? buildDescription(coupon, i, disabled)
              : Container(),
        ],
      ),
    );
  }

  Widget buildCoupons() {
    return _coupons.length == 0
        ? buildEmptyList()
        : ListView.builder(
            padding: Style.couponListPadding,
            controller: _scrollController,
            itemCount: _coupons.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCoupon(index, false);
            });
  }

  Widget buildDisabledCoupons() {
    return _disabledCoupons.length == 0
        ? buildEmptyList()
        : ListView.builder(
            padding: Style.couponListPadding,
            itemCount: _disabledCoupons.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCoupon(index, true);
            });
  }

  Widget buildTabView() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: couponWidget!.showCloseButton
                ? Style.couponListCloseButtonHeight
                : 0),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[buildCoupons(), buildDisabledCoupons()],
        ),
      ),
    );
  }

  Widget buildBottomSheet() {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Style.couponListCloseButtonBackground,
          border: Border(
              top: BorderSide(
                  width: Style.borderWidthBase, color: Style.borderColor))),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: Style.couponListCloseButtonHeight,
            alignment: AlignmentDirectional.center,
            child: Text(couponWidget!.closeButtonText,
                style: TextStyle(
                    fontSize: Style.couponListCloseButtonFontSize,
                    color: Style.couponListCloseButtonColor,
                    fontWeight: Style.fontWeightBold)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Style.couponListBackgroundColor,
          child: Column(
            children: <Widget>[
              couponWidget!.showExchangeBar ? buildSearchField() : Container(),
              buildTabBar(),
              buildTabView(),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child:
              couponWidget!.showCloseButton ? buildBottomSheet() : Container(),
        )
      ],
    );
  }
}

class CoupenItem {
  @required
  final String? name;
  @required
  final double? value;
  @required
  final String? valueDesc;
  @required
  final String? unitDesc;
  final String? condition;
  final String? startAt;
  final String? endAt;
  final String? description;
  final String? reason;

  CoupenItem(
      {this.name,
      this.condition,
      this.startAt,
      this.endAt,
      this.description,
      this.reason,
      this.value,
      this.valueDesc,
      this.unitDesc});
}
