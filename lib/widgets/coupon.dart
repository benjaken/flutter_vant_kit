import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/field.dart';
import 'package:flutter_kit/widgets/button.dart';

class Coupon extends StatefulWidget {
  // 当前选中优惠券的索引	
  int chosenCoupon;
  // 可用优惠券列表	
  List<CoupenItem> coupons;
  // 不可用优惠券列表	
  List<CoupenItem> disabledCoupons;
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
  final int displayedCouponIndex;
  // 是否显示列表底部按钮	
  final bool showCloseButton;
  // 列表底部按钮文字	
  final String closeButtonText;
  // 输入框文字提示	
  final String inputPlaceholder;
  // 是否展示兑换栏	
  final bool showExchangeBar;
  // 列表为空时的占位图	
  final Image emptyImage;
  // 优惠券切换回调	
  final Function(int val) onSelect;
  // 兑换优惠券回调	
  final Function(String val) onExchange;

  Coupon({
    Key key,
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
  }) : super(key: key);

  @override
  _Coupon createState() => _Coupon();
}

class _Coupon extends State<Coupon> with SingleTickerProviderStateMixin {
  TextEditingController searchInput = TextEditingController();
  TabController _tabController;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState () {
    _tabController = TabController(vsync: this, length: 2);
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  void _onLayoutDone(_) {
    int scrollIndex = widget.displayedCouponIndex??widget.chosenCoupon;
    if (scrollIndex != null && scrollIndex  > 2) {
      int couponsLength = widget.coupons.length;
      int prevIndex = (scrollIndex > (couponsLength - 2) ? couponsLength - 2 : scrollIndex) - 1;
      double index = ((150 * prevIndex) + 16).toDouble();
      double maxScroll = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(index > maxScroll ? maxScroll : index,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease
      );
    }
  }

  @override
  void dispose() {
    if (_tabController != null) _tabController.dispose();
    if (_scrollController != null) _scrollController.dispose();
    super.dispose();
  }

  Widget buildSearchField () {
    return Field(
      placeholder: widget.inputPlaceholder,
      controller: searchInput,
      maxLength: widget.exchangeMaxLength,
      onChange: (val) {
        setState(() {
          searchInput.text = val;
        });
      },
      right: CustomButton(
        text: widget.exchangeButtonText,
        size: "small",
        disabled: widget.exchangeButtonDisabled || searchInput.text == '',
        width: 60,
        onClick: () {
          if (widget.onExchange != null) widget.onExchange(searchInput.text);
        },
      ),
    );
  }

  Widget buildEmptyList () {
    return Image.network("https://img.yzcdn.cn/vant/coupon-empty.png");
  }

  Widget buildTabBar () {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 1, color: Color(0xffebedf0))
        )
      ),
      child: TabBar(
        tabs: <Widget>[
          Tab(text: "${widget.enabledTitle}（${widget.coupons.length}）"),
          Tab(text: "${widget.disabledTitle}（${widget.disabledCoupons.length}）"),
        ],
        controller: _tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }

  Widget buildCoupon (int i, bool disabled) {
    CoupenItem coupon = disabled ? widget.disabledCoupons[i] : widget.coupons[i];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(width: 1, color: Color(0xffebedf0)),
        color: Colors.white
      ),
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                focusColor: disabled ? Colors.transparent : Theme.of(context).focusColor,
                highlightColor: disabled ? Colors.transparent : Theme.of(context).highlightColor,
                hoverColor: disabled ? Colors.transparent : Theme.of(context).hoverColor,
                splashColor: disabled ? Colors.transparent : Theme.of(context).splashColor,
                onTap: () {
                  setState(() {
                    if (disabled) return;
                    widget.chosenCoupon = i;
                    if (widget.onSelect != null) widget.onSelect(i);
                    Navigator.of(context).pop();
                  });
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 4),
                              height: 24,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text("${coupon.valueDesc??''}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: disabled ? Colors.grey : Colors.red)),
                                  SizedBox(width: 4,),
                                  Text("${coupon.unitDesc??''}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color:  disabled ? Colors.grey : Colors.red)),
                                ],
                              ),
                            ),
                            Text("${coupon.condition??''}", style: TextStyle(fontSize: 12, color: Colors.grey))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 24,
                              margin: EdgeInsets.only(bottom: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text("${coupon.name??''}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  disabled ? Container() : Icon(Icons.check_circle, color: i == widget.chosenCoupon && !disabled ? Colors.red : Colors.transparent, size: 20),
                                ],
                              ),
                            ),
                            Text("有效期：${coupon.startAt??'null'} - ${coupon.endAt??'null'}", style: TextStyle(color: Colors.grey, fontSize: 12))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          (coupon.reason != null || coupon.description != null) ? Container(
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Color(0xffebedf0))
              ),
              color: Color(0xfffafafa)
            ),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              "${disabled ? coupon.reason : coupon.description}",
              style: TextStyle(color: Colors.grey, fontSize: 12)
            ),
          ) : Container(),
        ],
      ),
    );
  }

  Widget buildCoupons () {
    return widget.coupons.length == 0 ? buildEmptyList() : ListView.builder(
      padding: EdgeInsets.all(16),
      controller: _scrollController,
      itemCount: widget.coupons.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCoupon(index, false);
      }
    );
  }

  Widget buildDisabledCoupons () {
    return widget.disabledCoupons.length == 0 ? buildEmptyList() : ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: widget.disabledCoupons.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCoupon(index, true);
      }
    );
  }

  Widget buildTabView () {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.showCloseButton ? 50 : 0),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            buildCoupons(),
            buildDisabledCoupons()
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet () {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Color(0xffebedf0))
          )
        ),
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(widget.closeButtonText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.coupons = widget.coupons??[];
    widget.disabledCoupons = widget.disabledCoupons??[];
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            widget.showExchangeBar ? buildSearchField() : Container(),
            buildTabBar(),
            buildTabView(),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: widget.showCloseButton ? buildBottomSheet() : Container(),
        )
      ],
    );
  }
}

class CoupenItem {
  @required final String name;
  @required final double value;
  @required final String valueDesc;
  @required final String unitDesc;
  final String condition;
  final String startAt;
  final String endAt;
  final String description;
  final String reason;

  CoupenItem({this.name, this.condition, this.startAt, this.endAt, this.description, this.reason, this.value, this.valueDesc, this.unitDesc});
}