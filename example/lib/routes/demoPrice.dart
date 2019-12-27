import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPrice extends StatefulWidget {
  @override
  _DemoPrice createState() => _DemoPrice();
}

class _DemoPrice extends State<DemoPrice> {
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
          Price(
            value: 1234.567,
          ),
          title("保留三位小数"),
          Price(
            value: 1234.567,
            decimal: 3,
          ),
          title("自定义符号和颜色"),
          Price(
            currency: "\$",
            color: Colors.red,
            value: 1234.567,
          ),
          title("按照千分号形式显示"),
          Price(
            thousands: true,
            value: 10010.01,
          ),
        ],
      ),
    );
  }
}
