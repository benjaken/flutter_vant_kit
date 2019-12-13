import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  // 价格
  final double value;
  // 价格颜色
  final Color color;
  // 价格大小
  final double size;
  // 货币符号
  final String currency;
  // 保留的小数点
  final int decimal;
  // 是否按照千分号形式显示
  final bool thousands;

  const Price({
    Key key,
    this.currency: "¥",
    this.size: 20,
    @required this.value,
    this.color: Colors.black,
    this.decimal: 2,
    this.thousands: false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String integer = value.toInt().toString();
    RegExp reg = new RegExp(r"(\d)((?:\d{3})+\b)");
    if (thousands) while(reg.hasMatch(integer)) {
      integer = integer.replaceAllMapped(reg, (match) => "${match.group(1)},${match.group(2)}");
    }
    String decimalString = value.toStringAsFixed(decimal).split('.')[1];
    return Row(
      textBaseline: TextBaseline.ideographic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: <Widget>[
        Text("$currency", style: TextStyle(fontSize: (size / 1.5).toDouble(), color: color)),
        Text("$integer", style: TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold)),
        Text(".$decimalString", style: TextStyle(fontSize: (size / 1.5).toDouble(), color: color))
      ],
    );
  }
}