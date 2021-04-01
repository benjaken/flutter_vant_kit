import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCoupon extends StatefulWidget {
  @override
  _DemoCoupon createState() => _DemoCoupon();
}

class _DemoCoupon extends State<DemoCoupon> {
  String? _discount;
  int? _chosenCoupon;

  List<CoupenItem> coupons = List.generate(10, (i) {
    return CoupenItem(
        condition: '无使用门槛\n最多优惠12元',
        description: '描述信息',
        reason: '优惠券不可用原因',
        value: 150,
        name: '优惠券名称',
        startAt: DateFormat("yyyy-MM-dd").format(DateTime.parse("20170310")),
        endAt: DateFormat("yyyy-MM-dd").format(DateTime.parse("20171210")),
        valueDesc: i % 2 == 0 ? '8.5' : '1.5',
        unitDesc: i % 2 == 0 ? '折' : '元');
  });

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.all(20),
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
        Cell(
          title: "优惠券",
          value: _discount ?? "${coupons.length}张可用",
          isLink: true,
          onClick: () {
            Coupon(
              chosenCoupon: _chosenCoupon,
              coupons: coupons,
              disabledCoupons: coupons.sublist(0, 2),
              onSelect: (val) {
                setState(() {
                  _chosenCoupon = val;
                  String value = (coupons[val].value! / 100).toStringAsFixed(2);
                  _discount = "-¥$value";
                });
              },
            ).show(context);
          },
        )
      ],
    ));
  }
}
