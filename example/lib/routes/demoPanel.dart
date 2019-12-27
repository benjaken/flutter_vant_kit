import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPanel extends StatefulWidget {
  @override
  _DemoPanel createState() => _DemoPanel();
}

class _DemoPanel extends State<DemoPanel> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 30, 0, 10),
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
            Panel(
                title: "标题",
                desc: "描述信息",
                status: "状态",
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[Text("内容")],
                )),
            title("高级用法"),
            Panel(
              title: "标题",
              desc: "描述信息",
              status: "状态",
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[Text("内容")],
              ),
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  NButton(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    type: "danger",
                    size: "small",
                    width: 60,
                    text: "确定",
                    onClick: () => {},
                  ),
                  SizedBox(width: 8),
                  NButton(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    size: "small",
                    width: 60,
                    text: "取消",
                    onClick: () => {},
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
