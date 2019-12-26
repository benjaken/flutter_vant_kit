import 'package:flutter/material.dart';

import 'package:flutter_vant_kit/widgets/price.dart';

class demoPrice extends StatefulWidget{
  @override
  _demoPrice createState() => _demoPrice();
}


class _demoPrice extends State<demoPrice>{
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
          Price(
            value: 1234.567,
          ),
          Title("保留三位小数"),
          Price(
            value: 1234.567,
            decimal: 3,
          ),
          Title("自定义符号和颜色"),
          Price(
            currency: "\$",
            color: Colors.red,
            value: 1234.567,
          ),
          Title("按照千分号形式显示"),
          Price(
            thousands: true,
            value: 10010.01,
          ),
        ],
      ),
    );
  }
}