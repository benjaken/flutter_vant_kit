import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';

typedef CallBack();

class NButton extends StatelessWidget {
  // 类型
  final String type;
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
  final Gradient gradient;
  // 按钮内文字颜色
  final Color textColor;
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

  NButton(
      {Key key,
      this.type: "default",
      this.size: "normal",
      this.text,
      this.width,
      this.height,
      this.color,
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
      this.onClick})
      : assert(["mini", "small", "normal", "large"].indexOf(size) > -1,
            "size must be mini, small, normal, or large"),
        assert(
            ["default", "primary", "info", "danger", "warning"].indexOf(type) >
                -1,
            "type must be default, primary, info, danger or warning"),
        super(key: key);

  Color borderColor;
  Color buttonColor;
  Color buttonTextColor;

  Map<String, dynamic> sizes = {
    "mini": <String, dynamic>{
      "fontSize": Style.buttonMiniFontSize,
      "padding": EdgeInsets.symmetric(horizontal: 2),
      "height": Style.buttonMiniHeight
    },
    "small": <String, dynamic>{
      "fontSize": Style.buttonSmallFontSize,
      "padding": EdgeInsets.symmetric(horizontal: 8),
      "height": Style.buttonSmallHeight
    },
    "normal": <String, dynamic>{
      "fontSize": Style.buttonDefaultFontSize,
      "padding": EdgeInsets.symmetric(horizontal: 15),
      "height": Style.buttonDefaultHeight
    },
    "large": <String, dynamic>{
      "fontSize": Style.buttonLargeFontSize,
      "padding": EdgeInsets.symmetric(horizontal: 24),
      "height": Style.buttonLargeHeight
    },
  };

  Map<String, dynamic> colors = {
    "default": <String, Color>{
      "buttonColor": Style.buttonDefaultBackgroundColor,
      "borderColor": Style.buttonDefaultBorderColor,
      "textColor": Style.buttonDefaultColor
    },
    "primary": <String, Color>{
      "buttonColor": Style.buttonPrimaryBackgroundColor,
      "borderColor": Style.buttonPrimaryBorderColor,
      "textColor": Style.buttonPrimaryColor
    },
    "info": <String, Color>{
      "buttonColor": Style.buttonInfoBackgroundColor,
      "borderColor": Style.buttonInfoBorderColor,
      "textColor": Style.buttonInfoColor
    },
    "danger": <String, Color>{
      "buttonColor": Style.buttonDangerBackgroundColor,
      "borderColor": Style.buttonDangerBorderColor,
      "textColor": Style.buttonDangerColor
    },
    "warning": <String, Color>{
      "buttonColor": Style.buttonWarningBackgroundColor,
      "borderColor": Style.buttonWarningBorderColor,
      "textColor": Style.buttonWarningColor
    },
  };

  Widget buildContent() {
    return Container(
      width: width ?? null,
      height: height ?? sizes[size]["height"],
      padding: padding ?? sizes[size]["padding"],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: block ? MainAxisSize.max : MainAxisSize.min,
        children: <Widget>[
          loading
              ? SizedBox(
                  width: sizes[size]["fontSize"],
                  height: sizes[size]["fontSize"],
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(buttonTextColor),
                    backgroundColor: buttonColor,
                    strokeWidth: Style.borderWidthBase,
                  ),
                )
              : (icon != null ? icon : Container()),
          (loading || icon != null) && text != null
              ? SizedBox(width: Style.intervalSm)
              : Container(),
          text != null
              ? Text(text,
                  style: TextStyle(
                      color: buttonTextColor,
                      fontSize: sizes[size]["fontSize"]))
              : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (gradient == null) {
      borderColor = (color ?? colors[type]["borderColor"]);
      buttonColor = plain
          ? Style.buttonPlainBackgroundColor
          : (color ?? colors[type]["buttonColor"]);
    }
    buttonTextColor = (textColor ??
        (plain
            ? (color ?? colors[type]["buttonColor"])
            : ((color != null || gradient != null) && type == 'default'
                ? Colors.white
                : colors[type]["textColor"])));
    return Opacity(
      opacity: disabled ? Style.buttonDisabledOpacity : 1.0,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: buttonColor ?? null,
              gradient: gradient ?? null,
              border: gradient == null
                  ? Border.all(
                      color: borderColor,
                      width: hairline
                          ? Style.buttonHairBorderWidth
                          : Style.buttonBorderWidth)
                  : null,
              borderRadius: borderRadius ??
                  (square
                      ? null
                      : BorderRadius.circular(round
                          ? Style.buttonRoundBorderRadius
                          : Style.buttonBorderRadius))),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
                focusColor: (disabled || loading)
                    ? Colors.transparent
                    : Theme.of(context).focusColor,
                highlightColor: (disabled || loading)
                    ? Colors.transparent
                    : Theme.of(context).highlightColor,
                hoverColor: (disabled || loading)
                    ? Colors.transparent
                    : Theme.of(context).hoverColor,
                splashColor: (disabled || loading)
                    ? Colors.transparent
                    : Theme.of(context).splashColor,
                borderRadius: borderRadius ??
                    (square
                        ? null
                        : BorderRadius.circular(round
                            ? Style.buttonRoundBorderRadius
                            : Style.buttonBorderRadius)),
                onTap: () {
                  if (!disabled && !loading && onClick != null) onClick();
                },
                child: buildContent()),
          )),
    );
  }
}
