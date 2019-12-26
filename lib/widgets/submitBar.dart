import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/button.dart';
import 'package:flutter_vant_kit/widgets/price.dart';

class SubmitBar extends StatelessWidget {
  // 价格
  final double price;
  // 价格左侧文案
  final String label;
  // 价格右侧文案
  final String suffixLabel;
  // 价格文案对齐方向
  final String textAlign;
  // 按钮文字
  final String buttonText;
  // 提示文案
  final String tip;
  // 左侧图标
  final IconData tipIcon;
  // 是否禁用按钮
  final bool disabled;
  // 是否加载中
  final bool loading;
  // 货币符号
  final String currency;
  // 价格小数点后位数
  final int decimalLength;
  // 按钮点击事件回调
  final Function() onSubmit;
  // 提示文案中的额外操作和说明
  final Widget customTip;
  // 自定义订单栏上方内容
  final Widget customTop;
  // 自定义订单栏左侧内容
  final Widget customLeft;

  const SubmitBar(
      {Key key,
      this.price,
      this.label: "合计：",
      this.suffixLabel,
      this.textAlign: "right",
      this.buttonText,
      this.tip,
      this.tipIcon,
      this.disabled: false,
      this.loading: false,
      this.currency: "¥",
      this.decimalLength: 2,
      this.onSubmit,
      this.customTip,
      this.customTop,
      this.customLeft})
      : super(key: key);

  Widget buildTip() {
    return Container(
      padding: Style.submitBarTipPadding,
      color: Style.submitBarTipBackgroundColor,
      child: Row(
        children: <Widget>[
          tipIcon != null
              ? Icon(tipIcon,
                  color: Style.submitBarTipColor,
                  size: Style.submitBarTipIconSize)
              : Container(),
          SizedBox(width: tipIcon != null ? Style.intervalSm : 0),
          Text("$tip",
              style: TextStyle(
                  fontSize: Style.submitBarTipFontSize,
                  color: Style.submitBarTipColor)),
          customTip ?? Container()
        ],
      ),
    );
  }

  Widget buildContent() {
    return Container(
      height: Style.submitBarHeight,
      padding: Style.submitBarPadding,
      color: Style.submitBarBackgroundColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: textAlign == "right"
                  ? (customLeft != null
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end)
                  : MainAxisAlignment.start,
              children: <Widget>[
                customLeft ?? Container(),
                SizedBox(width: customLeft != null ? Style.intervalSm : 0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("$label",
                        style: TextStyle(
                            fontSize: Style.submitBarTextFontSize,
                            color: Style.submitBarTextColor)),
                    Price(
                        value: price,
                        currency: currency,
                        size: Style.submitBarPriceFontSize,
                        color: Style.submitBarPriceColor,
                        decimal: decimalLength)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: Style.paddingSm,
          ),
          NButton(
            text: loading ? "" : buttonText,
            round: true,
            gradient: Style.submitBarButtonColor,
            width: Style.submitBarButtonWidth,
            height: Style.submitBarButtonHeight,
            loading: loading,
            disabled: disabled,
            onClick: () {
              if (onSubmit != null) onSubmit();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tip != null ? buildTip() : Container(),
        customTop ?? Container(),
        buildContent()
      ],
    );
  }
}
