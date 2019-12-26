import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class NDivider extends StatefulWidget {
  // 分隔符文字
  final String content;
  // 文字颜色
  final Color fontColor;
  // 文字大小
  final double fontSize;
  // 分割线颜色
  Color lineColor;
  // 是否为细分割线
  final bool hairline;
  // 文本位置
  final String contentPosition;
  // 自定义分隔符内容
  final Widget child;

  NDivider(
      {Key key,
      this.content,
      this.fontColor: Style.dividerTextColor,
      this.fontSize: Style.dividerFontSize,
      this.lineColor,
      this.hairline: false,
      this.contentPosition: 'center',
      this.child})
      : super(key: key);

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
    widget.lineColor = widget.lineColor ?? Style.dividerBorderColor;
    return Container(
      key: _dividerKey,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.contentPosition == 'left'
              ? Container(
                  height: widget.hairline
                      ? Style.borderWidthHair
                      : Style.borderWidthBase,
                  width: Style.dividerContentLeftWidth,
                  color: widget.lineColor,
                )
              : Expanded(
                  child: Container(
                    height: widget.hairline
                        ? Style.borderWidthHair
                        : Style.borderWidthBase,
                    color: widget.lineColor,
                  ),
                ),
          (widget.child != null || widget.content != null)
              ? Container(
                  key: _textKey,
                  padding: Style.dividerContentPadding,
                  child: widget.child != null
                      ? widget.child
                      : Text(widget.content,
                          style: TextStyle(
                              fontSize: widget.fontSize,
                              color: widget.fontColor)),
                )
              : Container(),
          widget.contentPosition == 'right'
              ? Container(
                  height: widget.hairline
                      ? Style.borderWidthHair
                      : Style.borderWidthBase,
                  width: Style.dividerContentRightWidth,
                  color: widget.lineColor,
                )
              : Expanded(
                  child: Container(
                    height: widget.hairline
                        ? Style.borderWidthHair
                        : Style.borderWidthBase,
                    color: widget.lineColor,
                  ),
                ),
        ],
      ),
    );
  }
}
