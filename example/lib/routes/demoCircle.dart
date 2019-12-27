import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCircle extends StatefulWidget {
  @override
  _DemoCircle createState() => _DemoCircle();
}

class _DemoCircle extends State<DemoCircle> {
  double percentage = 70;

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
          Progress(
              percentage: 30,
              type: "circular",
              showPivot: true,
              circularSize: 120),
          title("样式定制"),
          Row(
            children: <Widget>[
              NButton(
                text: "增加",
                type: "primary",
                onClick: () {
                  setState(() {
                    percentage += 10;
                  });
                },
              ),
              SizedBox(width: 6),
              NButton(
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
              pivotText: "宽度定制"),
          Progress(
              percentage: percentage,
              type: "circular",
              showPivot: true,
              color: Colors.redAccent,
              pivotText: "颜色定制"),
          Progress(
              percentage: percentage,
              type: "circular",
              showPivot: true,
              circularSize: 150,
              color: Colors.purple,
              pivotText: "大小定制"),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
