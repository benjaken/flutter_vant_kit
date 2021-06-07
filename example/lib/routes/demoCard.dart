import 'package:example/generated/i18n.dart';
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
          title(I18n.of(context)!.basic_usage),
          NCard(
              title: I18n.of(context)!.product_name,
              desc: I18n.of(context)!.description,
              num: 2,
              price: 2.00,
              image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg")),
          title(I18n.of(context)!.marketing_information),
          NCard(
            title: I18n.of(context)!.product_name,
            desc: I18n.of(context)!.description,
            num: 2,
            price: 2.00,
            tag: I18n.of(context)!.tag,
            originPrice: 10.00,
            image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg"),
            onClick: () {
              Utils.toast(I18n.of(context)!.clicked);
            },
          ),
          title(I18n.of(context)!.custom_content),
          NCard(
            customTitle: Text(I18n.of(context)!.product_name,
                style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
            desc: I18n.of(context)!.description,
            num: 2,
            customPrice: Price(
              value: 2.0,
              color: Colors.red,
            ),
            image: Image.network("https://img.yzcdn.cn/vant/t-thirt.jpg"),
            customTags: Row(
              children: <Widget>[
                Tag(text: I18n.of(context)!.tag, plain: true),
                Tag(text: I18n.of(context)!.tag, plain: true)
              ],
            ),
            customFooter: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  NButton(
                    text: I18n.of(context)!.button,
                    round: true,
                    size: "mini",
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  ),
                  SizedBox(width: 6),
                  NButton(
                    text: I18n.of(context)!.button,
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
