import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/button.dart';
import 'package:flutter_kit/widgets/price.dart';

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
  final bool loading;
  // 货币符号	
  final String currency;
  // 价格小数点后位数	
  final int decimalLength;
  // 按钮点击事件回调	
  final Function onSubmit;
  // 提示文案中的额外操作和说明
  final Widget customTip;
  // 自定义订单栏上方内容
  final Widget customTop;
  // 自定义订单栏左侧内容
  final Widget customLeft;

  const SubmitBar({
    Key key,
    this.price,
    this.label: "合计：",
    this.suffixLabel,
    this.textAlign: "right",
    this.buttonText,
    this.tip,
    this.tipIcon,
    this.disabled: false,
    this.loading:false,
    this.currency: "¥",
    this.decimalLength: 2,
    this.onSubmit,
    this.customTip,
    this.customTop,
    this.customLeft
  }) : super(key: key);  

  Widget buildTip () {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      color: Color(0xfffff7cc),
      child: Row(
        children: <Widget>[
          tipIcon != null ? Icon(tipIcon, color: Color(0xfff56723), size: 12) : Container(),
          SizedBox(width: tipIcon != null ? 6 : 0),
          Text("$tip", style: TextStyle(fontSize: 12, color: Color(0xfff56723))),
          customTip??Container()
        ],
      ),
    );
  }

  Widget buildContent () {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: textAlign == "right" ? (customLeft != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end) : MainAxisAlignment.start,
              children: <Widget>[
                customLeft??Container(),
                SizedBox(width: customLeft != null ? 6 : 0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("$label", style: TextStyle(fontSize: 14)),
                    Price(value: price, currency: currency, size: 20, color: Colors.red, decimal: decimalLength)
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 12,),
          Opacity(
            opacity: disabled ? .5 : 1,
            child: CustomButton(
              text: loading ? "" : buttonText,
              round: true,
              gradient: LinearGradient(colors: [Color(0xffff6034), Color(0xffee0a24)]),
              width: 120,
              height: 40,
              loading: loading,
              disabled: disabled,
              onClick: () {
                if (onSubmit != null) onSubmit();
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tip!=null?buildTip():Container(),
        customTop??Container(),
        buildContent()
      ],
    );
  }
}