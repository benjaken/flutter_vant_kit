import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/radioGroup.dart';

class demoRadio extends StatefulWidget{
  @override
  _demoRadio createState() => _demoRadio();
}


class _demoRadio extends State<demoRadio> {
  List<CheckItem> list = [
    CheckItem(name: "a", text: "单选框1"),
    CheckItem(name: "b", text: "单选框2"),
  ];

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
          RadioGroup(
            value: 'a',
            list: list,
          ),
          Title("禁用状态"),
          RadioGroup(
            list: list,
            value: 'a',
            disabled: true
          ),
          Title("自定义颜色"),
          RadioGroup(
            list: list,
            value: 'a',
            checkedColor: Colors.green
          ),
          Title("自定义形状"),
          RadioGroup(
            list: list,
            value: 'a',
            shape: 'square',
          ),
          Title("搭配单元格组件使用"),
           RadioGroup(
            list: list,
            value: 'a',
            inCellGroup: true,
          ),
        ],
      )
    );
  }
}