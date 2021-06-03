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
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
          Cell(
            title: "预览图片",
            isLink: true,
            onClick: () {
              showImagePreview(
                context: context,
                images: images,
              );
            },
          ),
          title("传入配置项"),
          CellGroup(
            border: false,
            children: [
              Cell(
                title: "指定初始位置",
                isLink: true,
                onClick: () {
                  showImagePreview(
                      context: context,
                      images: images,
                      showIndicators: true,
                      startPosition: 2,
                      swipeDuration: Duration(seconds: 2),
                      onChange: (val) {
                        Utils.toast("Page Changed $val");
                      });
                },
              ),
              Cell(
                title: "展示关闭按钮",
                isLink: true,
                onClick: () {
                  showImagePreview(
                      context: context, images: images, closeable: true);
                },
              ),
              Cell(
                title: "监听关闭事件",
                isLink: true,
                onClick: () {
                  showImagePreview(
                      context: context,
                      images: images,
                      closeable: true,
                      onClose: (int index) {
                        Utils.toast('在第' + index.toString() + '张图片关闭');
                      });
                },
              )
            ],
          )
        ]));
  }
}
