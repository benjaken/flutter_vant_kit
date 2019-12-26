import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';
import 'package:flutter_kit/widgets/swipe.dart';

class ImagePreview extends StatefulWidget {
  // 需要预览的图片数组
  final List<Widget> images;
  // 图片预览起始位置索引
  final int startPosition;
  // 是否显示页数
  final bool showIndex;
  // 是否显示轮播指示器
  final bool showIndicators;
  // 动画时长
  final Duration swipeDuration;
  // 切换图片时的回调函数
  final Function(int val) onChange;

  ImagePreview(
      {Key key,
      this.images,
      this.startPosition: 0,
      this.showIndex: true,
      this.showIndicators: false,
      this.swipeDuration,
      this.onChange});

  @override
  _ImagePreview createState() => _ImagePreview();
}

class _ImagePreview extends State<ImagePreview> {
  int _current;

  @override
  void initState() {
    _current = widget.startPosition + 1;
    super.initState();
  }

  Widget buildPage(BuildContext context) {
    return Positioned(
      top: 0,
      left: MediaQuery.of(context).size.width / 2 - 20,
      child: Container(
        width: 40,
        alignment: AlignmentDirectional.center,
        child: Text("$_current/${widget.images.length}",
            style: TextStyle(
                fontSize: Style.imagePreviewIndexFontSize,
                color: Style.imagePreviewIndexTextColor,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none)),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Center(
        child: Container(
          height: Style.imagePreviewImageHeight,
          child: Swipe(
            initialSwipe: widget.startPosition,
            autoPlay: false,
            children: widget.images,
            showIndicators: widget.showIndicators,
            duration: widget.swipeDuration ?? Style.imagePreviewDuration,
            onChange: (val) {
              setState(() {
                _current = val;
              });
              if (widget.onChange != null) widget.onChange(val);
            },
          ),
        ),
      ),
      widget.showIndex ? buildPage(context) : Container()
    ]);
  }
}
