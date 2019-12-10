import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/button.dart';
import 'package:flutter_kit/widgets/steps.dart';

class demoSteps extends StatefulWidget{
  @override
  _demoSteps createState() => _demoSteps();
}


class _demoSteps extends State<demoSteps> {
  int _active = 1;

  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
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
          Steps(
            steps: [
              StepItem("test"),
              StepItem("test"),
              StepItem("test"),
              StepItem("test"),
            ],
            active: _active
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Wrap(
              runSpacing: 10,
              children: <Widget>[
                CustomButton(
                  text: "上一步",
                  plain: true,
                  onClick: () {
                    setState(() {
                      _active -= 1;
                    });
                  },
                ),
                CustomButton(
                  text: "下一步",
                  plain: true,
                  onClick: () {
                    setState(() {
                      _active += 1;
                    });
                  },
                ),
              ],
            )
          ),
          Title("自定义样式"),
          Steps(
            steps: [
              StepItem("test"),
              StepItem("test"),
              StepItem("test"),
              StepItem("test"),
            ],
            active: _active,
            activeIcon: Icons.done,
            inactiveIcon: Icons.chevron_right,
            activeColor: Colors.green,
          ),
          Title("竖向步骤条"),
          Steps(
            steps: [
              StepItem("【城市】物流状态1", "2016-07-12 12:40"),
              StepItem("【城市】物流状态2", "2016-07-12 12:40"),
              StepItem("【城市】物流状态3", "2016-07-12 12:40"),
              StepItem("【城市】快件已发货", "2016-07-12 12:40"),
            ],
            active: _active,
            direction: 'vertical',
          ),
        ]
      )
    );
  }
}