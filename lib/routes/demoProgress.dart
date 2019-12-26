import 'package:flutter/material.dart';

import 'package:flutter_vant_kit/widgets/progress.dart';


class demoProgress extends StatefulWidget{
  @override
  _demoProgress createState() => _demoProgress();
}


class _demoProgress extends State<demoProgress>{
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
          Progress(
            percentage: 50,
            showPivot: true
          ),
          Title("线条粗细"),
          Progress(
            percentage: 50,
            strokeWidth: 8,
            showPivot: true
          ),
          Title("置灰"),
          Progress(
            percentage: 50,
            inactive: true,
            showPivot: true
          ),
          Title("样式定制"),
          Column(
            children: <Widget>[
              Progress(
                percentage: 30,
                color: Colors.orangeAccent,
                pivotColor: Colors.orangeAccent,
                pivotText: "橙色",
                showPivot: true
              ),
              Progress(
                percentage: 50,
                color: Colors.redAccent,
                pivotColor: Colors.redAccent,
                pivotText: "红色",
                showPivot: true
              ),
              Progress(
                percentage: 70,
                color: Colors.purple,
                pivotColor: Colors.purple,
                pivotText: "紫色",
                showPivot: true
              )
            ],
          ),
        ],
      ),
    );
  }
}