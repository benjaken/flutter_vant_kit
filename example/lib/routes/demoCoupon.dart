import 'package:example/generated/i18n.dart';
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

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<CouponItem> coupons = List.generate(10, (i) {
      return CouponItem(
          condition: I18n.of(context)!.example_coupon_condition,
          description: I18n.of(context)!.description,
          reason: I18n.of(context)!.example_coupon_reason,
          value: 150,
          name: I18n.of(context)!.example_coupon_name,
          startAt: DateFormat("yyyy-MM-dd").format(DateTime.parse("20170310")),
          endAt: DateFormat("yyyy-MM-dd").format(DateTime.parse("20171210")),
          valueDesc: i % 2 == 0 ? '8.5' : '1.5',
          unitDesc:
              i % 2 == 0 ? I18n.of(context)!.discount : I18n.of(context)!.yuan);
    });
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title(I18n.of(context)!.basic_usage),
        Cell(
          title: I18n.of(context)!.coupon,
          value: _discount ?? "${coupons.length}${I18n.of(context)!.available}",
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
