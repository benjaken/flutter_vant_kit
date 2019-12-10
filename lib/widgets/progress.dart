import 'package:flutter/material.dart';


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
  Color color;
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
    this.strokeWidth: 5,
    this.showPivot: false,
    this.color: Colors.blueAccent,
    this.textColor: Colors.white,
    this.trackColor: Colors.grey,
    this.pivotText,
    this.pivotColor,
    this.circularSize: 120,
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
    double lineLeft = (widget.percentage / 100) * progressWidth - (pivotWidth / 2);
    setState(() {
      pivotLeft = widget.type == "circular" ? (widget.circularSize - pivotWidth) / 2
      : widget.percentage < 90 ? lineLeft : null;
      pivotRight = widget.type != "circular" && widget.percentage >= 90 ? 0 : null;
      pivotTop = widget.type == "circular" ? (widget.circularSize - pivotHeight) / 2 
        : -((pivotHeight - widget.strokeWidth) / 2);
    });
  }

  Widget Pivot(BuildContext context) {
    return Positioned(
      left: pivotLeft,
      top: pivotTop,
      child: Container(
        key: _pivotKey,
        padding: widget.type == "circular" ? null : EdgeInsets.fromLTRB(12, 2, 12, 2),
        decoration: BoxDecoration(
          color: widget.type == "circular" ? Colors.transparent : widget.pivotColor??widget.color,
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Text(
          widget.pivotText??(widget.percentage.toString() + "%"),
          style: TextStyle(
            color: widget.type == "circular" ? widget.pivotColor??Colors.black : widget.textColor,
            fontSize: widget.type == "circular" ? 14 : 12
          )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.color = widget.inactive ? Colors.grey[400] : widget.color;
    return Container(
      key: _progressKey,
      // padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          widget.type == "circular" ? SizedBox(
            height: widget.circularSize,
            width: widget.circularSize,
            child: CircularProgressIndicator(
              strokeWidth: widget.strokeWidth,
              backgroundColor: widget.trackColor.withOpacity(.4),
              valueColor: AlwaysStoppedAnimation(widget.color),
              value: widget.percentage / 100,
            ),
          ) : SizedBox(
            height: widget.strokeWidth,
            //TODO:增加动画效果
            child: LinearProgressIndicator(
              backgroundColor: widget.trackColor.withOpacity(.4),
              valueColor: AlwaysStoppedAnimation(widget.color),
              value: widget.percentage / 100,
            )
          ),
          if (widget.showPivot) Pivot(context)
        ]
      ),
    );
  }
}