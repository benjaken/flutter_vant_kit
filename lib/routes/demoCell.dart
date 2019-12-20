import 'package:flutter/material.dart';
import 'package:flutter_kit/utils/index.dart';

import 'package:flutter_kit/widgets/cell.dart';
import 'package:flutter_kit/widgets/cellGroup.dart';
import 'package:flutter_kit/widgets/tag.dart';

class demoCell extends StatefulWidget {
  @override
  _demoCell createState() => _demoCell();
}

class _demoCell extends State<demoCell> {
  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 30, 0, 10),
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
          CellGroup(
            children: <Widget>[
              Cell(title: "单元格", value: "内容"),
              Cell(title: "单元格", value: "内容", label: "描述信息", require: true),
            ]
          ),
          Title("单元格大小"),
          CellGroup(
            children: <Widget>[
              Cell(title: "单元格", value: "内容", size: "large"),
              Cell(title: "单元格", value: "内容", size: "large", label: "描述信息"),
            ]
          ),
          Title("展示图标"),
          CellGroup(
            children: <Widget>[
              Cell(title: "单元格", value: "内容", icon: Icons.my_location),
            ]
          ),
          Title("只设置 value"),
          CellGroup(
            children: <Widget>[
              Cell(value: "内容"),
            ]
          ),
          Title("可点击"),
          CellGroup(
            children: <Widget>[
              Cell(
                title: "单元格",
                isLink: true,
                onClick: () {
                  Utils.toast("Clicked");
                },
              ),
              Cell(
                title: "单元格",
                value: "内容",
                isLink: true,
                onClick: () {
                  Utils.toast("Clicked");
                },
              ),
              Cell(
                title: "单元格",
                value: "内容",
                label: "描述信息",
                arrowDirection: "down",
                isLink: true,
                onClick: () {
                  Utils.toast("Clicked");
                },
              ),
            ]
          ),
          Title("分组标题"),
          CellGroup(
            title: "分组 1",
            children: <Widget>[
              Cell(title: "单元格", value: "内容"),
            ]
          ),
          CellGroup(
            title: "分组 2",
            children: <Widget>[
              Cell(title: "单元格", value: "内容"),
            ]
          ),
          Title("自定义插槽"),
          CellGroup(
            children: <Widget>[
              Cell(
                customTitle: Row(
                  children: <Widget>[
                    Text("自定义标题"),
                    SizedBox(width: 4),
                    Tag(text: "标签", color: Colors.blueAccent,)
                  ],
                ),
                value: "内容",
                isLink: true,
              ),
              Cell(
                title: "单元格",
                icon: Icons.store,
                customRight: Icon(Icons.search, color: Colors.blueAccent, size: 16)
              )
            ]
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}