import 'package:flutter/material.dart';

class Cell extends StatelessWidget{
  // 左侧标题
  final String title;
  // 标题下方的描述信息
  final String label;
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
  final VoidCallback onClick;

  Cell({
    Key key,
    this.value,
    this.label,
    this.title,
    this.icon,
    this.require: false,
    this.clickable: false,
    this.isLink: false,
    this.onClick,
    this.arrowDirection: "right",
    this.customTitle,
    this.customLabel,
    this.customRight,
  }) : super(key: key);

  IconData getLinkIcon () {
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

  Widget buildContent () {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          mainAxisAlignment: (title != null || customTitle != null) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                require ? Text("*", style: TextStyle(
                    fontSize: 14,
                    color: Colors.redAccent,
                  )
                ) : Container(),
                icon != null ? Icon(icon, size: 14, color: Colors.black) : Container(),
                icon != null ? SizedBox(width: 4) : Container(),
                title != null ? Text(title, style: TextStyle(
                  fontSize: 14
                )) : Container(),
                customTitle??Container(),
              ],
            ),
            Row(
              children: <Widget>[
                value != null ? Text(value, style: TextStyle(
                  fontSize: 14,
                  color: (title != null || customTitle != null) ? Colors.grey : Colors.black
                )) : Container(),
                isLink ? Icon(getLinkIcon(), color: Colors.grey,) : Container(),
                customRight != null ? customRight : Container(),
              ],
            )
          ],
        ),
        SizedBox(height: 4.0),
        customLabel??(label != null ? Text(label, style: TextStyle(
          fontSize: 12,
          color: Colors.grey
        )) : Container())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ((clickable || isLink) && onClick != null) ? DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: buildContent()
          ),
          onTap: () {
            onClick();
          },
        ),
      ),
    ) : Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white,
      child: buildContent()
    );
  }
}