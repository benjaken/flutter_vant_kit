import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Cell extends StatelessWidget {
  // 左侧标题
  final String title;
  // 标题下方的描述信息
  final String label;
  // 单元格大小
  final String size;
  // 右侧内容
  final String value;
  // 左侧图标
  final IconData icon;
  // 是否显示表单必填星号
  final bool require;
  // 是否可点击
  final bool clickable;
  // 是否展示右侧箭头并开启点击反馈
  final bool isLink;
  // 箭头方向
  final String arrowDirection;
  // 自定义标题内容
  final Widget customTitle;
  // 自定义标题下方描述
  final Widget customLabel;
  // 自定义右侧内容
  final Widget customRight;
  // 点击单元格时触发
  final Function() onClick;

  Cell({
    Key key,
    this.value,
    this.label,
    this.title,
    this.icon,
    this.size: "normal",
    this.require: false,
    this.clickable: false,
    this.isLink: false,
    this.onClick,
    this.arrowDirection: "right",
    this.customTitle,
    this.customLabel,
    this.customRight,
  })  : assert(size == "normal" || size == "large",
            "size must be normal or large"),
        assert(["left", "right", "up", "down"].indexOf(arrowDirection) > -1,
            "arrowDirection must be left, right, up or down"),
        super(key: key);

  IconData getLinkIcon() {
    switch (arrowDirection) {
      case "left":
        return Icons.chevron_left;
        break;
      case "up":
        return Icons.expand_less;
        break;
      case "down":
        return Icons.expand_more;
        break;
      default:
        return Icons.chevron_right;
    }
  }

  Map<String, dynamic> sizes = {
    "normal": <String, dynamic>{
      "verticalPadding": Style.cellVerticalPadding,
      "titleFontSize": Style.cellFontSize,
      "labelFontSize": Style.cellLabelFontSize,
    },
    "large": <String, dynamic>{
      "verticalPadding": Style.cellLargeVerticalPadding,
      "titleFontSize": Style.cellLargeTitleFontSize,
      "labelFontSize": Style.cellLargeLabelFontSize,
    }
  };

  Widget buildLeft() {
    return Row(
      children: <Widget>[
        require
            ? Text("*",
                style: TextStyle(
                  fontSize: sizes[size]['titleFontSize'],
                  color: Style.cellRequiredColor,
                ))
            : Container(),
        icon != null
            ? Icon(icon, size: Style.cellIconSize, color: Style.cellTextColor)
            : Container(),
        icon != null ? SizedBox(width: Style.intervalSm) : Container(),
        title != null
            ? Text(title,
                style: TextStyle(
                  fontSize: sizes[size]['titleFontSize'],
                ))
            : Container(),
        customTitle ?? Container(),
      ],
    );
  }

  Widget buildRight() {
    return Row(
      children: <Widget>[
        value != null
            ? Text(value,
                style: TextStyle(
                    fontSize: Style.cellFontSize,
                    color: (title != null || customTitle != null)
                        ? Style.cellValueColor
                        : Style.cellTextColor))
            : Container(),
        isLink
            ? Icon(getLinkIcon(),
                color: Style.cellRightIconColor, size: Style.cellIconSize)
            : Container(),
        customRight != null ? customRight : Container(),
      ],
    );
  }

  Widget buildBottom() {
    return customLabel ??
        (label != null
            ? Text(label,
                style: TextStyle(
                    fontSize: sizes[size]['labelFontSize'],
                    color: Style.cellLabelColor))
            : Container());
  }

  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          mainAxisAlignment: (title != null || customTitle != null)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: <Widget>[buildLeft(), buildRight()],
        ),
        SizedBox(height: Style.intervalSm),
        buildBottom()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ((clickable || isLink) && onClick != null)
        ? DecoratedBox(
            decoration: BoxDecoration(color: Style.cellBackgroundColor),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: sizes[size]["verticalPadding"],
                        horizontal: Style.cellHorizontalPadding),
                    child: buildContent()),
                onTap: () {
                  onClick();
                },
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(
                vertical: sizes[size]["verticalPadding"],
                horizontal: Style.cellHorizontalPadding),
            color: Style.cellBackgroundColor,
            child: buildContent());
  }
}
