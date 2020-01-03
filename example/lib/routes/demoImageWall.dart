import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoImageWall extends StatefulWidget {
  @override
  _DemoImageWall createState() => _DemoImageWall();
}

class _DemoImageWall extends State<DemoImageWall> {
  List<String> images = [
    "https://img.yzcdn.cn/vant/leaf.jpg",
    "https://img.yzcdn.cn/vant/tree.jpg",
    "https://img.yzcdn.cn/vant/sand.jpg",
  ];

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title("基础用法"),
        ImageWall(
          images: images,
          count: 6,
          onUpload: (files) async {
            return Utils.toast(files.toString());
          },
          onChange: (image) {},
        ),
        title("多选图片"),
        ImageWall(
          images: images,
          count: 6,
          multiple: true,
          onUpload: (files) async {
            return Utils.toast(files.toString());
          },
          onChange: (image) {},
        ),
        // title("自定义每行数量"),
        // ImageWall(
        //   images: images,
        //   length: 3,
        //   onUpload: (files) async {},
        //   onChange: (image) {},
        // ),
        title("图片的缩放模式"),
        ImageWall(
          images: images,
          imageFit: BoxFit.contain,
          onUpload: (files) async {
            return Utils.toast(files.toString());
          },
          onChange: (image) {},
        )
      ],
    ));
  }
}
