import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoBadge extends StatefulWidget {
  @override
  _DemoBadge createState() => _DemoBadge();
}

class _DemoBadge extends State<DemoBadge> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  Widget testButton() {
    return NButton(
      text: "按钮",
      type: "primary",
      onClick: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title("数字"),
          Row(children: <Widget>[
            Badge(
              value: "10",
              child: testButton(),
            ),
          ]),
          title("红点"),
          Row(children: <Widget>[
            Badge(child: testButton(), dot: true),
          ]),
          title("文本"),
          Row(children: <Widget>[
            Badge(
              child: testButton(),
              value: "NEW",
            ),
          ]),
          title("自定义样式"),
          Row(
            children: <Widget>[
              Badge(
                value: "自定义",
                color: Colors.purpleAccent,
                child: testButton(),
              ),
              SizedBox(
                width: 25,
              ),
              Badge(
                value: "自定义",
                color: Colors.greenAccent,
                textColor: Colors.green,
                textSize: 16,
                child: testButton(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
