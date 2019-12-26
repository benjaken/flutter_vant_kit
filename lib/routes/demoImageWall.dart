import 'package:flutter/material.dart';
import 'package:flutter_kit/utils/index.dart';

import 'package:flutter_kit/widgets/ImageWall.dart';


class demoImageWall extends StatefulWidget{
  @override
  _demoImageWall createState() => _demoImageWall();
}


class _demoImageWall extends State<demoImageWall>{
  List<String> images = [
    "https://img.yzcdn.cn/vant/leaf.jpg",
    "https://img.yzcdn.cn/vant/tree.jpg",
    "https://img.yzcdn.cn/vant/sand.jpg",
  ];

  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Text(
        title, 
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("基础用法"),
          ImageWall(
            images: images,
            count: 6,
            onUpload: (files) async {
              Utils.toast(files.toString());
            },
            onChange: (image) {},
          ),
          Title("多选图片"),
          ImageWall(
            images: images,
            count: 6,
            multiple: true,
            onUpload: (files) async {
              Utils.toast(files.toString());
            },
            onChange: (image) {},
          ),
          // Title("自定义每行数量"),
          // ImageWall(
          //   images: images,
          //   length: 3,
          //   onUpload: (files) async {},
          //   onChange: (image) {},
          // ),
          Title("图片的缩放模式"),
          ImageWall(
            images: images,
            imageFit: BoxFit.cover,
            onUpload: (files) async {},
            onChange: (image) {},
          )
        ],
      )
    );
  }
}