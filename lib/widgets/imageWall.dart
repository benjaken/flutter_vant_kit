import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

//照片墙
class ImageWall extends StatefulWidget {
  // 图片文件数组
  final List<String> images;

  // 是否可以多选图片
  final bool multiple;

  // 单行的图片数量
  final int length;

  // 最多可以选择的图片张数
  final int count;

  // 图片预览样式
  final BoxFit imageFit;

  // 自定义 button
  final Widget uploadBtn;

  // 上传后返回全部图片信息
  final Function(List<String> newImages) onChange;

  // 监听图片上传
  final Future<List<String>> Function(List<Asset> file) onUpload;

  // 删除图片后的回调
  final Function(String removedUrl) onRemove;

  const ImageWall({
    Key key,
    this.multiple: false,
    this.length: 4,
    this.count: 9,
    this.images,
    this.uploadBtn,
    this.imageFit: BoxFit.cover,
    @required this.onChange,
    @required this.onUpload,
    this.onRemove,
  }) : super(key: key);

  @override
  _ImageWall createState() => _ImageWall();
}

class _ImageWall extends State<ImageWall> {
  List<String> images = [];
  double space = Style.imageWallItemGutter;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: Style.imageWallPadding,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: space,
          runSpacing: space,
          children: buildImages(),
        ));
  }

  List<Widget> buildImages() {
    List<Widget> widgets = [];
    images = widget.images ?? [];
    for (int i = 0; i < images.length; i++) {
      widgets.add(_buildImageItem(i));
    }
    if (widget.count == null || images.length < widget.count) {
      widgets.add(_buildAddImageButton());
    }
    return widgets;
  }

  Widget _buildImageItem(int index) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        ClipRRect(
            child: Image.network(
              images[index],
              fit: widget.imageFit,
              width: Style.imageWallItemSize,
              height: Style.imageWallItemSize,
            ),
            borderRadius:
                BorderRadius.circular(Style.imageWallItemBorderRadius)),
        Positioned(
          right: 0,
          top: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(Style.borderRadiusMax),
            child: Icon(Icons.cancel,
                color: Style.imageWallCloseButtonColor,
                size: Style.imageWallCloseButtonFontSize),
            onTap: () {
              String removedUrl;
              setState(() {
                removedUrl = images.removeAt(index);
              });
              widget.onChange(images);
              if (widget.onRemove != null) {
                widget.onRemove(removedUrl);
              }
            },
          ),
        )
      ],
    );
  }

  Widget _buildAddImageButton() {
    Widget btn = Container(
      width: Style.imageWallItemSize,
      height: Style.imageWallItemSize,
      decoration: BoxDecoration(
          border: Border.all(
            color: Style.imageWallUploadBorderColor,
          ),
          borderRadius: BorderRadius.circular(Style.imageWallItemBorderRadius)),
      child: Icon(Icons.add,
          color: Style.imageWallUploadColor, size: Style.imageWallUploadSize),
    );

    return InkWell(
      child: widget.uploadBtn ?? btn,
      onTap: () async {
        List<Asset> resultList = List<Asset>();
        try {
          resultList = await MultiImagePicker.pickImages(
            maxImages: widget.multiple ? widget.count - images.length : 1,
            enableCamera: true,
            cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
            materialOptions: MaterialOptions(
                startInAllView: true,
                useDetailsView: true,
                selectCircleStrokeColor: "#000000",
                actionBarColor: "#000000"),
          );
        } on Exception catch (e) {
          print(e.toString());
        }
        List<String> urls = await widget.onUpload(resultList);
        if (urls == null || urls.isEmpty) {
          return;
        }
        setState(() {
          images.addAll(urls);
        });
        widget.onChange(images);
      },
    );
  }
}
