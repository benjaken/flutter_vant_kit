import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Badge extends StatefulWidget {
  // 角标内容
  final String? value;
  // 红点
  final bool dot;
  // 最大值，超过最大值会显示，仅当content为数字时有效
  final int? max;
  // 自定义颜色
  final Color color;
  // 自定义文本颜色
  final Color textColor;
  // 自定义文本大小
  final double textSize;
  // 自定义内容
  final Widget? child;
  // 自定义徽标内容
  final Widget? content;

  const Badge(
      {Key? key,
      this.value,
      this.dot: false,
      this.max,
      this.color: Style.badgeBackgroundColor,
      this.textColor: Style.badgeTextColor,
      this.textSize: Style.badgeTextFontSize,
      this.child,
      this.content})
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
    if (widget.value != null || widget.content != null || widget.dot)
      WidgetsBinding.instance!.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  _onLayoutDone(_) {
    RenderBox badge = _badgeKey.currentContext!.findRenderObject() as RenderBox;
    double badgeWidth = badge.size.width;
    double badgeHeight = badge.size.height;
    setState(() {
      _badgeTop = -(badgeHeight / 2);
      _badgeLeft = -(badgeWidth / 2);
    });
  }

  formatValue(String val) {
    var format = int.tryParse(val);
    if (format is int) {
      return widget.max != null && format > (widget.max as int)
          ? (widget.max.toString() + '+')
          : format.toString();
    } else {
      return val;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = widget.child != null ? [widget.child as Widget] : [];
    if (widget.value != null || widget.content != null || widget.dot) {
      widgets.add(Positioned(
        top: _badgeTop,
        right: _badgeLeft,
        child: Container(
          key: _badgeKey,
          padding: (widget.value != null || widget.content != null)
              ? Style.badgeValuePadding
              : EdgeInsets.all(Style.badgeDotPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Style.borderRadiusMax),
            color: widget.color,
          ),
          child: widget.content != null
              ? widget.content
              : widget.value != null
                  ? Text(formatValue(widget.value!),
                      style: TextStyle(
                          color: widget.textColor, fontSize: widget.textSize))
                  : Container(),
        ),
      ));
    }
    return Stack(
      clipBehavior: Clip.none,
      children: widgets,
    );
  }
}
