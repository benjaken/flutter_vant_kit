import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoSteps extends StatefulWidget {
  @override
  _DemoSteps createState() => _DemoSteps();
}

class _DemoSteps extends State<DemoSteps> {
  int _active = 1;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
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
          Steps(steps: [
            StepItem(I18n.of(context)!.buyer_orders),
            StepItem(I18n.of(context)!.merchant_orders),
            StepItem(I18n.of(context)!.buyer_pick_up),
            StepItem(I18n.of(context)!.transaction_complete),
          ], active: _active),
          Padding(
              padding: EdgeInsets.all(20),
              child: Wrap(
                runSpacing: 10,
                children: <Widget>[
                  NButton(
                    text: I18n.of(context)!.prev,
                    type: "primary",
                    plain: true,
                    onClick: () {
                      setState(() {
                        _active -= 1;
                        if (_active < 0) _active = 3;
                      });
                    },
                  ),
                  SizedBox(width: 6),
                  NButton(
                    text: I18n.of(context)!.next,
                    type: "primary",
                    plain: true,
                    onClick: () {
                      setState(() {
                        _active += 1;
                        if (_active > 3) _active = 0;
                      });
                    },
                  ),
                ],
              )),
          title(I18n.of(context)!.custom_style),
          Steps(
            steps: [
              StepItem(I18n.of(context)!.buyer_orders),
              StepItem(I18n.of(context)!.merchant_orders),
              StepItem(I18n.of(context)!.buyer_pick_up),
              StepItem(I18n.of(context)!.transaction_complete),
            ],
            active: _active,
            activeIcon: Icons.done,
            inactiveIcon: Icons.chevron_right,
            activeColor: Colors.green,
          ),
          title(I18n.of(context)!.vertical_step_bar),
          Steps(
            steps: [
              StepItem(I18n.of(context)!.step1, "2016-07-12 12:40"),
              StepItem(I18n.of(context)!.step2, "2016-07-12 12:40"),
              StepItem(I18n.of(context)!.step3, "2016-07-12 12:40"),
              StepItem(I18n.of(context)!.step4, "2016-07-12 12:40")
            ],
            active: _active,
            direction: 'vertical',
          ),
        ]));
  }
}
