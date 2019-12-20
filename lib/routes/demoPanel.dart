import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/panel.dart';
import 'package:flutter_kit/widgets/button.dart';


class demoPanel extends StatefulWidget{
  @override
  _demoPanel createState() => _demoPanel();
}


class _demoPanel extends State<demoPanel>{
  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
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
          Panel(
            title: "标题",
            desc: "描述信息",
            status: "状态",
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                 Text("内容")
              ],
            )
          ),
          Title("高级用法"),
          Panel(
            title: "标题",
            desc: "描述信息",
            status: "状态",
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                 Text("内容")
              ],
            ),
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                NButton(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  type: "primary",
                  size: "small",
                  text: "确定",
                  onClick: () => {},
                ),
                SizedBox(width: 8),
                NButton(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  type: "primary",
                  size: "small",
                  text: "取消",
                  plain: true,
                  onClick: () => {},
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}