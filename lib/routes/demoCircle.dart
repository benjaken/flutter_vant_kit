import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/button.dart';
import 'package:flutter_kit/widgets/progress.dart';

class demoCircle extends StatefulWidget {
  @override
  _demoCircle createState() => _demoCircle();
}

class _demoCircle extends State<demoCircle> {
  double percentage = 70;

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
            percentage: 30,
            type: "circular",
            showPivot: true,
            circularSize: 120
          ),
          Title("样式定制"),
          Row(
            children: <Widget>[
              CustomButton(
                text: "增加",
                type: "primary",
                onClick: () {
                  setState(() {
                    percentage += 10;
                  });
                },
              ),
              SizedBox(width: 6),
              CustomButton(
                text: "减少",
                type: "danger",
                onClick: () {
                  setState(() {
                    percentage -= 10;
                  });
                },
              )
            ],
          ),
          Progress(
            percentage: percentage,
            type: "circular",
            showPivot: true,
            strokeWidth: 10,
            pivotText: "宽度定制"
          ),
          Progress(
            percentage: percentage,
            type: "circular",
            showPivot: true,
            color: Colors.redAccent,
            pivotText: "颜色定制"
          ),
          Progress(
            percentage: percentage,
            type: "circular",
            showPivot: true,
            circularSize: 150,
            color: Colors.purple,
            pivotText: "大小定制"
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}