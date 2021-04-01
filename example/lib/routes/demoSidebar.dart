import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoSidebar extends StatefulWidget {
  @override
  _DemoSidebar createState() => _DemoSidebar();
}

class _DemoSidebar extends State<DemoSidebar> {
  String? _status = "New";
  int _active = 0;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<SideBarItem> list1 = [
      SideBarItem(title: "标签名"),
      SideBarItem(title: "标签名"),
      SideBarItem(title: "标签名"),
    ];

    List<SideBarItem> list2 = [
      SideBarItem(title: "标签名", dot: true),
      SideBarItem(title: "标签名", info: "5"),
      SideBarItem(
          title: "标签名",
          info: _status,
          onClick: (val) {
            setState(() {
              _status = null;
              _active = val;
            });
          }),
    ];

    List<SideBarItem> list3 = [
      SideBarItem(title: "标签名"),
      SideBarItem(title: "标签名", disabled: true),
      SideBarItem(title: "标签名"),
    ];
    return SingleChildScrollView(
      child: Wrap(
        spacing: 100,
        runSpacing: 30,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title("基础用法"),
                Sidebar(
                  list: list1,
                )
              ]),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title("提示信息"),
                Sidebar(
                  active: _active,
                  list: list2,
                )
              ]),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title("禁用选项"),
                Sidebar(
                  list: list3,
                )
              ]),
        ],
      ),
    );
  }
}
