import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/utils/index.dart';
import 'package:flutter_vant_kit/widgets/button.dart';
import 'package:flutter_vant_kit/widgets/imagePreview.dart';

class demoImagePreview extends StatefulWidget{
  @override
  _demoImagePreview createState() => _demoImagePreview();
}


class _demoImagePreview extends State<demoImagePreview> {
  List<Widget> images = [
    Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-2.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-3.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-4.jpg")
  ];

  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
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
          NButton(
            text: "预览图片",
            type: "primary",
            onClick: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return ImagePreview(
                    images: images,
                  );
                }
              );
            },
          ),
          Title("指定初始位置"),
          NButton(
            text: "指定初始位置",
            type: "primary",
            onClick: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return ImagePreview(
                    images: images,
                    showIndicators: true,
                    startPosition: 2,
                    swipeDuration: Duration(seconds: 2),
                    onChange: (val) {
                      Utils.toast("Page Changed $val");
                    }
                  );
                }
              );
            },
          )
        ]
      )
    );
  }
}