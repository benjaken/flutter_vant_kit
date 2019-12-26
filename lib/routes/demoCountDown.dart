import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/widgets/countDown.dart';

class demoCountDown extends StatefulWidget{
  @override
  _demoCountDown createState() => _demoCountDown();
}


class _demoCountDown extends State<demoCountDown> {
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
          CountDown(Duration(seconds: 1))
        ],
      )
    );
  }
}