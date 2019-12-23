import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';

class Badge extends StatefulWidget {
  // 角标内容
  final String value;
  // 红点
  final bool dot;
  // 自定义颜色
  final Color color;
  // 自定义文本颜色
  final Color textColor;
  // 自定义文本大小
  final double textSize;
  // 自定义内容
  final Widget child;

  const Badge(
      {Key key,
      this.value,
      this.dot: false,
      this.color: Style.badgeBackgroundColor,
      this.textColor: Style.badgeTextColor,
      this.textSize: Style.badgeTextFontSize,
      @required this.child})
      : super(key: key);

  @override
  _Badge createState() => _Badge();
}

class _Badge extends State<Badge> {
  GlobalKey _badgeKey = GlobalKey();
  double _badgeTop = 0;
  double _badgeLeft = 0;

  @override
  void initState() {
    if (widget.value != null || widget.dot)
      WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  _onLayoutDone(_) {
    RenderBox badge = _badgeKey.currentContext.findRenderObject();
    double badgeWidth = badge.size.width;
    double badgeHeight = badge.size.height;
    setState(() {
      _badgeTop = -(badgeHeight / 2);
      _badgeLeft = -(badgeWidth / 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [widget.child];
    if (widget.value != null || widget.dot) {
      widgets.add(Positioned(
        top: _badgeTop,
        right: _badgeLeft,
        child: Container(
          key: _badgeKey,
          padding: widget.value != null
              ? Style.badgeValuePadding
              : EdgeInsets.all(Style.badgeDotPadding),
          decoration: BoxDecoration(
            borderRadius: widget.value != null
                ? BorderRadius.circular(Style.borderRadiusMax)
                : BorderRadius.circular(Style.borderRadiusMax),
            color: widget.color,
          ),
          child: widget.value != null
              ? Text(widget.value,
                  style: TextStyle(
                      color: widget.textColor, fontSize: widget.textSize))
              : Container(),
        ),
      ));
    }
    return Stack(
      overflow: Overflow.visible,
      children: widgets,
    );
  }
}
