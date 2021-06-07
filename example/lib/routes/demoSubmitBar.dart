import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoSubmitBar extends StatefulWidget {
  @override
  _DemoSubmitBar createState() => _DemoSubmitBar();
}

class _DemoSubmitBar extends State<DemoSubmitBar> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
          SubmitBar(buttonText: I18n.of(context)!.submit_orders, price: 30.50),
          title(I18n.of(context)!.disabled_status),
          SubmitBar(
            buttonText: I18n.of(context)!.submit_orders,
            price: 30.50,
            tip: I18n.of(context)!.address_tip,
            tipIcon: Icons.error_outline,
            disabled: true,
          ),
          title(I18n.of(context)!.loading_status),
          SubmitBar(
            buttonText: I18n.of(context)!.submit_orders,
            price: 30.50,
            loading: true,
          ),
          title(I18n.of(context)!.advanced_usage),
          SubmitBar(
            buttonText: I18n.of(context)!.submit_orders,
            price: 30.50,
            tip: I18n.of(context)!.address_tip,
            customTip: GestureDetector(
              onTap: () {
                Utils.toast("Clicked Tip");
              },
              child: Text(I18n.of(context)!.change_address,
                  style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
            ),
            customLeft:
                NCheckbox(text: I18n.of(context)!.select_all, value: true),
          ),
        ]));
  }
}
