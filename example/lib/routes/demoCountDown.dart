import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCountDown extends StatefulWidget {
  @override
  _DemoCountDown createState() => _DemoCountDown();
}

class _DemoCountDown extends State<DemoCountDown> {
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
      children: <Widget>[title("基础用法"), CountDown(Duration(seconds: 1))],
    ));
  }
}
