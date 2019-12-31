import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Progress extends StatefulWidget {
  // 进度条类型
  final String type;
  // 是否置灰
  final bool inactive;
  // 进度百分比
  final double percentage;
  // 进度条粗细
  final double strokeWidth;
  // 是否显示进度条文字
  final bool showPivot;
  // 进度条颜色
  final Color color;
  // 进度文字颜色
  final Color textColor;
  // 轨道颜色
  final Color trackColor;
  // 文字显示
  final String pivotText;
  // 文字背景色
  final Color pivotColor;
  // 圆形进度条大小
  final double circularSize;

  Progress({
    Key key,
    this.type: "line",
    this.inactive: false,
    this.percentage: 0,
    this.strokeWidth: Style.progressHeight,
    this.showPivot: false,
    this.color: Style.progressColor,
    this.textColor: Style.progressPivotTextColor,
    this.trackColor: Style.progressBackgroundColor,
    this.pivotText,
    this.pivotColor,
    this.circularSize: Style.circleSize,
  }) : super(key: key);

  @override
  _Progress createState() => _Progress();
}

class _Progress extends State<Progress> with SingleTickerProviderStateMixin {
  GlobalKey _pivotKey = GlobalKey();
  GlobalKey _progressKey = GlobalKey();
  double pivotLeft = 0;
  double pivotTop = 0;
  double pivotRight;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  _onLayoutDone(_) {
    RenderBox pivot = _pivotKey.currentContext.findRenderObject();
    double pivotWidth = pivot.size.width;
    double pivotHeight = pivot.size.height;
    RenderBox progress = _progressKey.currentContext.findRenderObject();
    double progressWidth = progress.size.width;
    double lineLeft =
        (widget.percentage / 100) * progressWidth - (pivotWidth / 2);
    setState(() {
      pivotLeft = widget.type == "circular"
          ? (widget.circularSize - pivotWidth) / 2
          : widget.percentage < 90 ? lineLeft : null;
      pivotRight =
          widget.type != "circular" && widget.percentage >= 90 ? 0 : null;
      pivotTop = widget.type == "circular"
          ? (widget.circularSize - pivotHeight) / 2
          : -((pivotHeight - widget.strokeWidth) / 2);
    });
  }

  Widget pivot(BuildContext context) {
    Color color = widget.inactive ? Style.progressDisabledColor : widget.color;
    return Positioned(
      left: pivotLeft,
      top: pivotTop,
      child: Container(
        key: _pivotKey,
        padding: widget.type == "circular" ? null : Style.progressPivotPadding,
        decoration: BoxDecoration(
            color: widget.type == "circular"
                ? Colors.transparent
                : widget.pivotColor ?? color,
            borderRadius: BorderRadius.circular(Style.borderRadiusMax)),
        child: Text(
            widget.pivotText ?? (widget.percentage.toStringAsFixed(0) + "%"),
            style: TextStyle(
                color: widget.type == "circular"
                    ? widget.pivotColor ?? Style.circleTextColor
                    : widget.textColor,
                fontSize: widget.type == "circular"
                    ? Style.circleTextFontSize
                    : Style.progressPivotFontSize)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = widget.inactive ? Style.progressDisabledColor : widget.color;
    return Container(
      key: _progressKey,
      margin: Style.progressMargin,
      child: Stack(overflow: Overflow.visible, children: <Widget>[
        widget.type == "circular"
            ? SizedBox(
                height: widget.circularSize,
                width: widget.circularSize,
                child: CircularProgressIndicator(
                  strokeWidth: widget.strokeWidth,
                  backgroundColor: widget.trackColor,
                  valueColor: AlwaysStoppedAnimation(color),
                  value: widget.percentage / 100,
                ),
              )
            : SizedBox(
                height: widget.strokeWidth,
                //TODO:增加动画效果
                child: LinearProgressIndicator(
                  backgroundColor: widget.trackColor,
                  valueColor: AlwaysStoppedAnimation(color),
                  value: widget.percentage / 100,
                )),
        if (widget.showPivot) pivot(context)
      ]),
    );
  }
}
