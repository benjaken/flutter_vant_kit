import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoRadio extends StatefulWidget {
  @override
  _DemoRadio createState() => _DemoRadio();
}

class _DemoRadio extends State<DemoRadio> {
  List<RadioItem> list = [
    RadioItem(name: "a", text: "单选框1"),
    RadioItem(name: "b", text: "单选框2"),
  ];

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
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
        RadioGroup(
          value: 'a',
          list: list,
        ),
        title("禁用状态"),
        RadioGroup(list: list, value: 'a', disabled: true),
        title("自定义颜色"),
        RadioGroup(list: list, value: 'a', checkedColor: Colors.green),
        title("自定义形状"),
        RadioGroup(
          list: list,
          value: 'a',
          shape: 'square',
        ),
        title("搭配单元格组件使用"),
        RadioGroup(
          list: list,
          value: 'a',
          inCellGroup: true,
        ),
      ],
    ));
  }
}
