import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCheckbox extends StatefulWidget {
  @override
  _DemoCheckbox createState() => _DemoCheckbox();
}

class _DemoCheckbox extends State<DemoCheckbox> {
  List<CheckItem> list = [
    CheckItem(name: "a", text: "复选框a"),
    CheckItem(name: "b", text: "复选框b"),
  ];

  List<CheckItem> list2 = [
    CheckItem(name: "a", text: "复选框a"),
    CheckItem(name: "b", text: "复选框b"),
    CheckItem(name: "c", text: "复选框c", checkedColor: Colors.green),
    CheckItem(name: "d", text: "复选框d", disabled: true),
  ];

  List<CheckItem> list3 = [
    CheckItem(name: "a", text: "复选框a"),
    CheckItem(name: "b", text: "复选框b"),
    CheckItem(name: "c", text: "复选框c"),
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
        CheckboxGroup(
          list: list,
          value: ["a"],
          onChange: (list) {
            Utils.toast(list.toString());
          },
        ),
        title("禁用状态"),
        CheckboxGroup(
          list: list,
          value: ["a"],
          disabled: true,
        ),
        title("自定义形状"),
        CheckboxGroup(
          list: list,
          value: ["a"],
          shape: "square",
        ),
        title("自定义颜色"),
        CheckboxGroup(
          list: list,
          value: ["a"],
          checkedColor: Colors.green,
        ),
        title("复选框组"),
        CheckboxGroup(
          list: list2,
          value: ["a", "b"],
        ),
        title("设置最大可选数"),
        CheckboxGroup(
          list: list3,
          value: ["a"],
          max: 2,
        ),
        title("单元格组件"),
        CheckboxGroup(
          list: list3,
          value: ['a'],
          inCellGroup: true,
        ),
        SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
