import 'package:flutter/material.dart';
import 'package:flutter_kit/utils/index.dart';

import 'package:flutter_kit/widgets/rate.dart';


class demoRate extends StatefulWidget{
  @override
  _demoRate createState() => _demoRate();
}


class _demoRate extends State<demoRate>{
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
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("基础用法"),
          Rate(
            value: 3,
          ),
          Title("自定义图标"),
          Rate(
            value: 3,
            icon: Icons.favorite,
            voidIcon: Icons.favorite_border,
            onChange: (v) {
              Utils.toast(v);
            },
          ),
          Title("自定义样式"),
          Rate(
            value: 3,
            color: Colors.blueAccent,
            voidColor: Colors.blueAccent,
            size: 36.0,
            gutter: 8.0,
            onChange: (v) {
              Utils.toast(v);
            },
          ),
          Title("自定义数量"),
          Rate(
            count: 7,
            value: 4,
          ),
          Title("禁用状态"),
          Rate(
            value: 3,
            disabled: true
          ),
          Title("只读状态"),
          Rate(
            value: 3,
            readonly: true
          )
        ]
      )
    );
  }
}