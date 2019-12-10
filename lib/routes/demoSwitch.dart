import 'package:flutter/material.dart';

class demoSwitch extends StatefulWidget {
  @override
  _demoSwitch createState() => _demoSwitch();
}

class _demoSwitch extends State<demoSwitch> {
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
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("基础用法"),
        ],
      ),
    );
  }
}