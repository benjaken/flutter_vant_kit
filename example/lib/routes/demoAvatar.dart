import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoAvatar extends StatefulWidget {
  @override
  _DemoAvatar createState() => _DemoAvatar();
}

class _DemoAvatar extends State<DemoAvatar> {
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
          title("基本用法"),
          Wrap(
            spacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Avatar(type: 'large'),
              Avatar(),
              Avatar(type: 'small'),
            ],
          ),
          title("形状类型"),
          Wrap(
            spacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Avatar(type: 'large', shape: "square"),
              Avatar(shape: "square"),
              Avatar(type: 'small', shape: "square"),
            ],
          ),
          title("修改颜色"),
          Avatar(color: Colors.blueAccent, iconColor: Colors.white),
          title("自定义内容"),
          Wrap(
            spacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Avatar(
                custom: Text("U"),
              ),
              Avatar(image: NetworkImage("https://img.yzcdn.cn/vant/cat.jpeg")),
              Avatar(
                custom: Image.network(
                    "http://img10.360buyimg.com/uba/jfs/t1/69001/30/2126/550/5d06f947Effd02898/95f18e668670e598.png",
                    width: 20),
              ),
            ],
          ),
          title("点击触发事件"),
          Avatar(
            onClick: () {
              Utils.toast("Clicked!");
            },
          ),
        ],
      ),
    );
  }
}
