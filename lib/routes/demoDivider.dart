import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/divider.dart';

class demoDivider extends StatefulWidget {
  @override
  _demoDivider createState() => _demoDivider();
}

class _demoDivider extends State<demoDivider> {
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
          NDivider(),
          Title("展示文本"),
          NDivider(
            content: "分割线",
          ),
          Title("内容位置"),
          NDivider(
            content: "分割线",
            contentPosition: 'left',
          ),
          SizedBox(height: 10),
          NDivider(
            content: "分割线",
            contentPosition: 'right',
          ),
          Title("细分割线"),
          NDivider(
            content: "分割线",
            hairline: true,
          ),
          Title("自定义颜色"),
          NDivider(
            lineColor: Colors.redAccent,
            fontColor: Colors.redAccent,
            content: "没有更多了"
          ),
          SizedBox(height: 10),
          NDivider(
            lineColor: Colors.orangeAccent,
            fontColor: Colors.orangeAccent,
            content: "没有更多了"
          ),
          SizedBox(height: 10),
          NDivider(
            lineColor: Colors.blueAccent,
            fontColor: Colors.blueAccent,
            content: "没有更多了"
          ),
          Title("自定义内容"),
          NDivider(
            child: Icon(Icons.cancel, color: Colors.blueAccent)
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}