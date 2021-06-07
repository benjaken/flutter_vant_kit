import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPanel extends StatefulWidget {
  @override
  _DemoPanel createState() => _DemoPanel();
}

class _DemoPanel extends State<DemoPanel> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
            Panel(
                title: I18n.of(context)!.title,
                desc: I18n.of(context)!.description,
                status: I18n.of(context)!.status,
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[Text(I18n.of(context)!.content)],
                )),
            title(I18n.of(context)!.advanced_usage),
            Panel(
              title: I18n.of(context)!.title,
              desc: I18n.of(context)!.description,
              status: I18n.of(context)!.status,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[Text(I18n.of(context)!.content)],
              ),
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  NButton(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    type: "danger",
                    size: "small",
                    width: 60,
                    text: I18n.of(context)!.confirm,
                    onClick: () => {},
                  ),
                  SizedBox(width: 8),
                  NButton(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    size: "small",
                    width: 60,
                    text: I18n.of(context)!.cancel,
                    onClick: () => {},
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
