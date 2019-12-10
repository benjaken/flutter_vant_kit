import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/cell.dart';
import 'package:flutter_kit/widgets/cellGroup.dart';
import 'package:flutter_kit/widgets/stepper.dart';

class demoStepper extends StatefulWidget {
  @override
  _demoStepper createState() => _demoStepper();
}

class _demoStepper extends State<demoStepper> {

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
          CellGroup(
            children: <Widget>[
              Cell(
                title: "基础用法",
                customRight: Steppers(
                  onChange: (val) {
                    print(val);
                  },
                ),
              ),
              Cell(
                title: "步长设置",
                customRight: Steppers(
                  step: 2,
                  onChange: (val) {
                    print(val);
                  },
                ),
              ),
              Cell(
                title: "限制输入范围",
                customRight: Steppers(
                  value: 5,
                  min: 5,
                  max: 10,
                  onChange: (val) {
                    print(val);
                  },
                ),
              ),
              Cell(
                title: "禁用状态",
                customRight: Steppers(
                  value: 1,
                  disabled: true
                ),
              ),
              Cell(
                title: "禁用输入框状态",
                customRight: Steppers(
                  value: 1,
                  disabledInput: true,
                  onChange: (val) {},
                ),
              ),
              Cell(
                title: "小数点",
                customRight: Steppers(
                  value: 1,
                  step: 0.2,
                  decimalLength: 2,
                  inputWidth: 46,
                  onChange: (val) {},
                ),
              ),
              Cell(
                title: "自定义大小",
                customRight: Steppers(
                  value: 1,
                  size: 28,
                  inputWidth: 100,
                  onChange: (val) {},
                ),
              )
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}