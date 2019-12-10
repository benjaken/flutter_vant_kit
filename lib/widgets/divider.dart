import 'package:flutter/material.dart';

class NDivider extends StatefulWidget {
  // 分隔符文字	
  final String content;
  // 文字颜色	
  final Color fontColor;
  // 文字大小
  final double fontSize;
  // 分割线颜色	
  Color lineColor;
  // 背景颜色
  final Color backgroundColor;
  // 自定义分隔符内容
  final Widget child;

  NDivider({
    Key key,
    this.content,
    this.fontColor: Colors.blueAccent,
    this.fontSize: 12,
    this.lineColor,
    this.backgroundColor: Colors.white,
    this.child
  }) : super(key: key);

  @override
  _NDivider createState() => _NDivider();
}

class _NDivider extends State<NDivider> {
  GlobalKey _textKey = GlobalKey();
  GlobalKey _dividerKey = GlobalKey();
  double itemWidth = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.child != null || widget.content != null) _onLayoutDone(_);
    });
    super.initState();
  }

  _onLayoutDone(_) {
    RenderBox text = _textKey.currentContext.findRenderObject();
    double textWidth = text.size.width;
    setState(() {
      itemWidth = (MediaQuery.of(context).size.width - textWidth) / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.lineColor = widget.lineColor??Color(0xffebedf0);
    return Container(
      key: _dividerKey,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 1,
              color: widget.lineColor,
            ),
          ),
          (widget.child != null || widget.content != null) ? Container(
            key: _textKey,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: widget.child != null ? widget.child : Text(widget.content,
              style: TextStyle(fontSize: widget.fontSize, color: widget.fontColor)
            ),
          ) : Container(),
          Expanded(
            child: Container(
              height: 1,
              color: widget.lineColor,
            ),
          ),
          // Positioned(
          //   top: textTop,
          //   left: textLeft,
          //   child: 
          // ),
        ],
      ),
    );
  }
}
