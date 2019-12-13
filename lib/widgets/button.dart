import 'package:flutter/material.dart';

typedef CallBack();

class CustomButton extends StatelessWidget {
  // 尺寸
  final String size;
  // 按钮文字	
  final String text;
  // 按钮宽度
  final double width;
  // 按钮高度
  final double height;
  // 按钮颜色
  final Color color;
  // 左侧图标
  final Widget icon;
  // 渐变色设置
  Gradient gradient;
  // 按钮内文字颜色
  Color textColor;
  // 是否为块级元素	
  final bool block;
  // 是否为朴素按钮	
  final bool plain;
  // 是否为方形按钮	
  final bool square;
  // 是否为圆形按钮	
  final bool round;
  // 是否禁用按钮	
  final bool disabled;
  // 是否为加载中
  final bool loading;
  // 是否使用 0.5px 边框	
  final bool hairline;
  // 自定义内边距
  final EdgeInsets padding;
  // 自定义按钮圆角
  final BorderRadius borderRadius;
  // 点击后回调
  final CallBack onClick;

  Color borderColor;
  Color buttonColor;

  CustomButton({
    Key key,
    this.size: "normal",
    this.text,
    this.width,
    this.height,
    this.color: Colors.blueAccent,
    this.textColor,
    this.icon,
    this.block: false,
    this.plain: false,
    this.square: false,
    this.round: false,
    this.disabled: false,
    this.hairline: false,
    this.loading: false,
    this.padding,
    this.borderRadius,
    this.gradient,
    this.onClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> sizes = {
      "mini": <String, dynamic>{
        "fontSize": 12.0,
        "padding": EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        "borderRadius": 99.0,
      },
      "small": <String, dynamic>{
        "fontSize": 12.0,
        "padding": EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        "borderRadius": 99.0,
      },
      "normal": <String, dynamic>{
        "fontSize": 14.0,
        "padding": EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        "borderRadius": 99.0,
      },
      "large": <String, dynamic>{
        "fontSize": 14.0,
        "padding": EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        "borderRadius": 99.0,
      },
    };
    if (gradient == null) {
      borderColor = color == Colors.white ? Colors.grey.withOpacity(disabled ? .1 : .4) : color.withOpacity(disabled ? .4 : 1);
      buttonColor = plain ? Colors.white : color.withOpacity(disabled ? .4 : 1);
    }
    textColor = (textColor != null ? textColor : (plain ? color : color == Colors.white ? Colors.black : Colors.white)).withOpacity(disabled ? .8 : 1);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: buttonColor??null,
        gradient: gradient??null,
        border: gradient == null ? Border.all(color: borderColor, width: hairline ? .5 : 1) : null,
        borderRadius: borderRadius??(square ? null : BorderRadius.circular(round ? sizes[size]["borderRadius"] : 3.0))
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          focusColor: (disabled || loading) ? Colors.transparent : Theme.of(context).focusColor,
          highlightColor: (disabled || loading) ? Colors.transparent : Theme.of(context).highlightColor,
          hoverColor: (disabled || loading) ? Colors.transparent : Theme.of(context).hoverColor,
          splashColor: (disabled || loading) ? Colors.transparent : Theme.of(context).splashColor,
          borderRadius: borderRadius??(square ? null : BorderRadius.circular(round ? sizes[size]["borderRadius"] : 3.0)),
          onTap: () {
            if (!disabled && !loading && onClick != null) onClick();
          },
          child: Container(
            width: width??null,
            height: height??null,
            padding: padding??sizes[size]["padding"],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: block ? MainAxisSize.max : MainAxisSize.min,
              children: <Widget>[
                loading ? SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(textColor),
                    backgroundColor: buttonColor,
                    strokeWidth: 1,
                  ),
                ) : (icon != null ? icon : Container()),
                (loading || icon != null) && text != null ? SizedBox(width: 6) : Container(),
                text != null ? Text(text, style: TextStyle(color: textColor, fontSize: sizes[size]["fontSize"])) : Container(),
              ],
            ),
          )
        ),
      )
    );
  }
}