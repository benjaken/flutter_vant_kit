import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoStepper extends StatefulWidget {
  @override
  _DemoStepper createState() => _DemoStepper();
}

class _DemoStepper extends State<DemoStepper> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
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
                title: I18n.of(context)!.basic_usage,
                customRight: Steppers(
                  onChange: (val) {
                    Utils.toast(val);
                  },
                ),
              ),
              Cell(
                title: I18n.of(context)!.step_size,
                customRight: Steppers(
                  step: 2,
                  onChange: (val) {
                    Utils.toast(val);
                  },
                ),
              ),
              Cell(
                title: I18n.of(context)!.limit_input_range,
                customRight: Steppers(
                  value: 5,
                  min: 5,
                  max: 10,
                  onChange: (val) {
                    Utils.toast(val);
                  },
                ),
              ),
              Cell(
                title: I18n.of(context)!.disabled_status,
                customRight: Steppers(value: 1, disabled: true),
              ),
              Cell(
                title: I18n.of(context)!.displayed_input_status,
                customRight: Steppers(
                  value: 1,
                  disabledInput: true,
                  onChange: (val) {},
                ),
              ),
              Cell(
                title: I18n.of(context)!.decimal_point,
                customRight: Steppers(
                  value: 1,
                  step: 0.2,
                  decimalLength: 2,
                  inputWidth: 46,
                  onChange: (val) {},
                ),
              ),
              Cell(
                title: I18n.of(context)!.custom_size,
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
