import 'package:flutter/material.dart';

class DemoImage extends StatefulWidget {
  @override
  _DemoImage createState() => _DemoImage();
}

class _DemoImage extends State<DemoImage> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  Widget rowImgge(Widget child, String text) {
    return Column(
      children: <Widget>[
        child,
        SizedBox(height: 10),
        Text(text, style: TextStyle(color: Colors.grey))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title("基础用法"),
        Wrap(direction: Axis.horizontal, spacing: 20, children: <Widget>[
          Image.asset("imgs/avatar.png", width: 100, height: 100),
          Image.network("https://img.yzcdn.cn/vant/cat.jpeg",
              width: 100, height: 100)
        ]),
        title("填充模式"),
        Wrap(
            direction: Axis.horizontal,
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              rowImgge(
                  Image.network("https://img.yzcdn.cn/vant/cat.jpeg",
                      width: 100, height: 100, fit: BoxFit.contain),
                  "contain"),
              rowImgge(
                  Image.network("https://img.yzcdn.cn/vant/cat.jpeg",
                      width: 100, height: 100, fit: BoxFit.cover),
                  "cover"),
              rowImgge(
                  Image.network("https://img.yzcdn.cn/vant/cat.jpeg",
                      width: 100, height: 100, fit: BoxFit.fill),
                  "fill"),
              rowImgge(
                  Image.network("https://img.yzcdn.cn/vant/cat.jpeg",
                      width: 100, height: 100, fit: BoxFit.none),
                  "none"),
              rowImgge(
                  Image.network("https://img.yzcdn.cn/vant/cat.jpeg",
                      width: 100, height: 100, fit: BoxFit.scaleDown),
                  "scale-down"),
              SizedBox(width: 10),
            ]),
        title("带加载提示的图片"),
        Wrap(
          direction: Axis.horizontal,
          spacing: 20,
          children: <Widget>[
            Image.network(
              'https://img.yzcdn.cn/vant/cat.jpeg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ],
        )
      ],
    ));
  }
}
