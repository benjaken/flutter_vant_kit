import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCard extends StatefulWidget {
  @override
  _DemoCard createState() => _DemoCard();
}

class _DemoCard extends State<DemoCard> {
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
          NCard(
              title: "商品名称",
              desc: "描述信息",
              num: 2,
              price: 2.00,
              image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg")),
          title("营销信息"),
          NCard(
            title: "商品名称",
            desc: "描述信息",
            num: 2,
            price: 2.00,
            tag: "标签",
            originPrice: 10.00,
            image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg"),
            onClick: () {
              Utils.toast("Clicked");
            },
          ),
          title("自定义内容"),
          NCard(
            customTitle: Text("商品名称",
                style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
            desc: "描述信息",
            num: 2,
            customPrice: Price(
              value: 2.0,
              color: Colors.red,
            ),
            image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg"),
            customTags: Row(
              children: <Widget>[
                Tag(text: "标签", plain: true),
                Tag(text: "标签", plain: true)
              ],
            ),
            customFooter: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  NButton(
                    text: "按钮",
                    round: true,
                    size: "mini",
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  ),
                  SizedBox(width: 6),
                  NButton(
                    text: "按钮",
                    round: true,
                    size: "mini",
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
