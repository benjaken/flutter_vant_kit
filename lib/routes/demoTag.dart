import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/tag.dart';


class demoTag extends StatefulWidget{
  @override
  _demoTag createState() => _demoTag();
}


class _demoTag extends State<demoTag>{
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
          Row(
            children: <Widget>[
              Tag(
                color: Colors.grey,
                text: "标签"
              ),
              Tag(
                text: "标签"
              ),
              Tag(
                color: Colors.greenAccent,
                text: "标签"
              ),
              Tag(
                color: Colors.redAccent,
                text: "标签"
              ),
              Tag(
                color: Colors.orangeAccent,
                text: "标签"
              ),
            ],
          ),
          Title("圆角样式"),
          Row(
            children: <Widget>[
              Tag(
                color: Colors.grey,
                round: true,
                text: "标签"
              ),
              Tag(
                text: "标签",
                round: true,
              ),
              Tag(
                color: Colors.greenAccent,
                round: true,
                text: "标签"
              ),
              Tag(
                color: Colors.redAccent,
                round: true,
                text: "标签"
              ),
              Tag(
                color: Colors.orangeAccent,
                round: true,
                text: "标签"
              ),
            ],
          ),
          Title("标记样式"),
          Row(
            children: <Widget>[
              Tag(
                color: Colors.grey,
                mark: true,
                text: "标签"
              ),
              Tag(
                mark: true,
                text: "标签"
              ),
              Tag(
                color: Colors.greenAccent,
                mark: true,
                text: "标签"
              ),
              Tag(
                color: Colors.redAccent,
                mark: true,
                text: "标签"
              ),
              Tag(
                color: Colors.orangeAccent,
                mark: true,
                text: "标签"
              ),
            ],
          ),
          Title("空心样式"),
          Row(
            children: <Widget>[
              Tag(
                color: Colors.grey,
                plain: true,
                text: "标签"
              ),
              Tag(
                plain: true,
                text: "标签"
              ),
              Tag(
                color: Colors.greenAccent,
                plain: true,
                text: "标签"
              ),
              Tag(
                color: Colors.redAccent,
                plain: true,
                text: "标签"
              ),
              Tag(
                color: Colors.orangeAccent,
                plain: true,
                text: "标签"
              ),
            ],
          ),
          Title("自定义颜色"),
          Row(
            children: <Widget>[
              Tag(
                color: Colors.pinkAccent,
                text: "标签"
              ),
              Tag(
                color: Colors.pinkAccent,
                plain: true,
                text: "标签"
              ),
              Tag(
                color: Colors.purple,
                text: "标签"
              ),
              Tag(
                color: Colors.purple,
                plain: true,
                text: "标签"
              ),
              Tag(
                color: Colors.red[100],
                textColor: Colors.red[600],
                text: "标签"
              ),
            ]
          ),
          Title("可关闭标签"),
          Row(
            children: <Widget>[
              Tag(
                text: "标签",
                onClose: () async {
                  print("close");
                },
              ),
              Tag(
                color: Colors.green,
                text: "标签",
                onClose: () async {
                  print("close");
                },
              )
            ]
          )
        ],
      )
    );
  }
}