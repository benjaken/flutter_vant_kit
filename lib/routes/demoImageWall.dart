import 'package:flutter/material.dart';
import 'package:flutter_kit/utils/index.dart';

import 'package:flutter_kit/widgets/ImageWall.dart';


class demoImageWall extends StatefulWidget{
  @override
  _demoImageWall createState() => _demoImageWall();
}


class _demoImageWall extends State<demoImageWall>{
  List<String> images = [
    "https://storage.360buyimg.com/mtd/home/111543234387022.jpg",
    "https://storage.360buyimg.com/mtd/home/221543234387016.jpg",
    "https://storage.360buyimg.com/mtd/home/36549825_887087111478302_5745542532574478336_n1543234831971.jpg",
  ];

  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
      padding: EdgeInsets.symmetric(horizontal: 20),
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
          Title("自定义每行数量"),
          ImageWall(
            images: images,
            length: 3,
            onUpload: (files) async {},
            onChange: (image) {},
          ),
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