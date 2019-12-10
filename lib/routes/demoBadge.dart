import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/badge.dart';
import 'package:flutter_kit/widgets/button.dart';

class demoBadge extends StatefulWidget {
  @override
  _demoBadge createState() => _demoBadge();
}

class _demoBadge extends State<demoBadge> {
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

  Widget testButton() {
    return CustomButton(
      text: "按钮",
      onClick: () {},  
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("数字"),
          Row(
            children: <Widget>[
              Badge(
                value: "10",
                child: testButton(),
              ),
            ]
          ),
          Title("红点"),
          Row(
            children: <Widget>[
              Badge(
                child: testButton(),
                dot: true
              ),
            ]
          ),
          Title("文本"),
          Row(
            children: <Widget>[
              Badge(
                child: testButton(),
                value: "NEW",
              ),
            ]
          ),
          Title("省略号"),
          Row(
            children: <Widget>[
              Badge(
                value: "…",
                child: testButton(),
              ),
            ]
          ),
          Title("自定义样式"),
          Row(
            children: <Widget>[
              Badge(
                value: "自定义",
                color: Colors.purpleAccent,
                child: testButton(),
              ),
              SizedBox(width: 25,),
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