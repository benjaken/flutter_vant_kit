import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoImagePreview extends StatefulWidget {
  @override
  _DemoImagePreview createState() => _DemoImagePreview();
}

class _DemoImagePreview extends State<DemoImagePreview> {
  List<Widget> images = [
    Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-2.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-3.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-4.jpg")
  ];

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
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
                  });
            },
          ),
          title("指定初始位置"),
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
                        });
                  });
            },
          )
        ]));
  }
}
