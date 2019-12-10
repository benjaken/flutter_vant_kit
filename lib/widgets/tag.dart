import 'package:flutter/material.dart';

typedef CallBack();

class Tag extends StatefulWidget{
  // 标签内文字
  final String text;
  // 是否为空心样式
  final bool plain;
  // 是否为圆角样式
  final bool round;
  // 是否为标记样式
  final bool mark;
  // 标签颜色
  final Color color;
  // 文字颜色，优先于color属性
  Color textColor;
  // 是否为可关闭标签
  final CallBack onClose;

  Tag({
    Key key,
    this.text: "",
    this.plain: false,
    this.round: false,
    this.mark: false,
    this.color: Colors.blueAccent,
    this.textColor,
    this.onClose,
  }): super(key: key);

  @override
  _Tag createState() => _Tag();

}

class _Tag extends State<Tag> {
  bool isShow = true;

  void close() {
    widget.onClose();
    setState(() {
      isShow = false;
    });
  } 

  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.color;
    Color bageColor = widget.plain ? Colors.white : widget.color;
    widget.textColor = widget.textColor != null ? widget.textColor : (widget.plain ? widget.color : Colors.white);
    return Visibility(
      visible: isShow,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        margin: const EdgeInsets.only(right: 6.0),
        decoration: BoxDecoration(
          color: bageColor,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: widget.mark ? BorderRadius.horizontal(
            left: Radius.circular(2.0),
            right: Radius.circular(10.0)
          ) : BorderRadius.circular(widget.round ? 10.0 : 2.0),
        ),
        height: 20.0,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: 12
              )
            ),
            widget.onClose != null ? GestureDetector(
              child: Icon(
                Icons.close,
                color: widget.textColor,
                size: 12,
              ),
              //TODO:增加动画效果
              onTap: () => close(),
            ) : Container()
          ],
        ),
      ),
    );
  }
}