import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/utils/index.dart';

import 'package:flutter_vant_kit/widgets/button.dart';
import 'package:flutter_vant_kit/widgets/price.dart';
import 'package:flutter_vant_kit/widgets/tag.dart';
import 'package:flutter_vant_kit/widgets/card.dart';

class demoCard extends StatefulWidget {
  @override
  _demoCard createState() => _demoCard();
}

class _demoCard extends State<demoCard> {
  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
          NCard(
            title: "商品名称",
            desc: "描述信息",
            num: 2,
            price: 2.00,
            image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg")
          ),
          Title("营销信息"),
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
          Title("自定义内容"),
          NCard(
            customTitle: Text("商品名称", style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
            desc: "描述信息",
            num: 2,
            customPrice: Price(value: 2.0, color: Colors.red,),
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
        ]
      )
    );
  }
}