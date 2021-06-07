import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoProgress extends StatefulWidget {
  @override
  _DemoProgress createState() => _DemoProgress();
}

class _DemoProgress extends State<DemoProgress> {
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
          title(I18n.of(context)!.basic_usage),
          Progress(percentage: 50, showPivot: true),
          title(I18n.of(context)!.line_thickness),
          Progress(percentage: 50, strokeWidth: 8, showPivot: true),
          title(I18n.of(context)!.ash),
          Progress(percentage: 50, inactive: true, showPivot: true),
          title(I18n.of(context)!.custom_style),
          Column(
            children: <Widget>[
              Progress(
                  percentage: 30,
                  color: Colors.orangeAccent,
                  pivotColor: Colors.orangeAccent,
                  pivotText: I18n.of(context)!.orange,
                  showPivot: true),
              Progress(
                  percentage: 50,
                  color: Colors.redAccent,
                  pivotColor: Colors.redAccent,
                  pivotText: I18n.of(context)!.red,
                  showPivot: true),
              Progress(
                  percentage: 70,
                  color: Colors.purple,
                  pivotColor: Colors.purple,
                  pivotText: I18n.of(context)!.purple,
                  showPivot: true)
            ],
          ),
        ],
      ),
    );
  }
}
