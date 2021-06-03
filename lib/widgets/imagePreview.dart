import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/swipe.dart';

class ImagePreview extends StatefulWidget {
  // 需要预览的图片数组
  final List<Widget> images;
  // 图片预览起始位置索引
  final int? startPosition;
  // 是否显示页数
  final bool showIndex;
  // 是否显示轮播指示器
  final bool? showIndicators;
  // 动画时长
  final Duration? swipeDuration;
  // 是否显示关闭图标
  final bool closeable;
  // 关闭图标名称
  final IconData? closeIcon;
  // 关闭图标位置，可选值为top-left bottom-left bottom-right
  final String closeIconPosition;
  // 切换图片时的回调函数
  final Function(int val)? onChange;
  // 关闭时触发
  final Function(int index)? onClose;

  ImagePreview(
      {Key? key,
      required this.images,
      this.startPosition: 0,
      this.showIndex: true,
      this.showIndicators: false,
      this.swipeDuration,
      this.closeable: false,
      this.closeIcon,
      this.closeIconPosition: 'top-right',
      this.onChange,
      this.onClose});

  @override
  _ImagePreview createState() => _ImagePreview();
}

class _ImagePreview extends State<ImagePreview> {
  late int _current;

  @override
  void initState() {
    _current = (widget.startPosition ?? 0) + 1;
    super.initState();
  }

  Widget buildPage(BuildContext context) {
    return Positioned(
      top: 0,
      left: MediaQuery.of(context).size.width / 2 - 20,
      child: Container(
        width: 40,
        height: 20,
        alignment: AlignmentDirectional.center,
        child: Text("$_current/${widget.images.length}",
            style: TextStyle(
                height: 1.5,
                fontSize: Style.imagePreviewIndexFontSize,
                color: Style.imagePreviewIndexTextColor,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none)),
      ),
    );
  }

  Widget buildClose(BuildContext context) {
    Map<String, AlignmentGeometry> position = {
      'top-left': Alignment.topLeft,
      'bottom-left': Alignment.bottomLeft,
      'top-right': Alignment.topRight,
      'bottom-right': Alignment.bottomRight
    };
    return Align(
        alignment: position[widget.closeIconPosition] as AlignmentGeometry,
        child: Container(
          width: Style.imagePreviewCloseSize,
          height: Style.imagePreviewCloseSize,
          alignment: AlignmentDirectional.center,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            child: Icon(
              widget.closeIcon ?? Icons.cancel,
              color: Style.imagePreviewCloseColor,
              size: Style.imagePreviewCloseSize,
            ),
            onTap: () {
              Navigator.of(context).pop();
              if (widget.onClose != null) widget.onClose!(_current);
            },
          ),
        ));
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
            showIndicators: widget.showIndicators ?? true,
            duration: widget.swipeDuration ?? Style.imagePreviewDuration,
            onChange: (val) {
              setState(() {
                _current = val;
              });
              if (widget.onChange != null) widget.onChange!(val);
            },
          ),
        ),
      ),
      widget.closeable ? buildClose(context) : Container(),
      widget.showIndex ? buildPage(context) : Container(),
    ]);
  }
}

Future<T?> showImagePreview<T>(
    {required BuildContext context,
    required List<Widget> images,
    int? startPosition,
    bool showIndex: true,
    bool? showIndicators: false,
    Duration? swipeDuration,
    bool closeable: false,
    IconData? closeIcon,
    String closeIconPosition: 'top-right',
    Function(int val)? onChange,
    Function(int index)? onClose}) {
  return showDialog(
      context: context,
      barrierDismissible: !closeable,
      barrierColor: Colors.black87,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () => Future.value(!closeable),
            child: ImagePreview(
              images: images,
              showIndex: showIndex,
              startPosition: startPosition,
              showIndicators: showIndicators,
              swipeDuration: swipeDuration,
              closeable: closeable,
              closeIcon: closeIcon,
              closeIconPosition: closeIconPosition,
              onChange: onChange,
              onClose: onClose,
            ));
      });
}
