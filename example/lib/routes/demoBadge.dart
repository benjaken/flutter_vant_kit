import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoBadge extends StatefulWidget {
  @override
  _DemoBadge createState() => _DemoBadge();
}

class _DemoBadge extends State<DemoBadge> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  Widget testWidget() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: Color(0xffdcdee0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title(I18n.of(context)!.basic_usage),
          Wrap(spacing: 16.0, children: <Widget>[
            Badge(
              value: "5",
              child: testWidget(),
            ),
            Badge(
              value: "10",
              child: testWidget(),
            ),
            Badge(
              value: "Hot",
              child: testWidget(),
            ),
            Badge(
              dot: true,
              child: testWidget(),
            ),
          ]),
          title(I18n.of(context)!.max),
          Wrap(spacing: 16.0, children: <Widget>[
            Badge(
              value: "20",
              max: 9,
              child: testWidget(),
            ),
            Badge(
              value: "50",
              max: 20,
              child: testWidget(),
            ),
            Badge(
              value: "200",
              max: 99,
              child: testWidget(),
            ),
          ]),
          title(I18n.of(context)!.custom_color),
          Wrap(
            spacing: 16.0,
            children: <Widget>[
              Badge(
                value: "5",
                color: Color(0xff1989fa),
                child: testWidget(),
              ),
              Badge(
                value: "10",
                color: Colors.greenAccent,
                textColor: Colors.green,
                child: testWidget(),
              ),
              Badge(
                dot: true,
                color: Color(0xff1989fa),
                child: testWidget(),
              ),
            ],
          ),
          title(I18n.of(context)!.custom_content),
          Wrap(
            spacing: 16.0,
            children: <Widget>[
              Badge(
                  content: Icon(Icons.add, size: 12.0, color: Colors.white),
                  child: testWidget()),
              Badge(
                  content: Icon(Icons.close, size: 12.0, color: Colors.white),
                  child: testWidget())
            ],
          )
        ],
      ),
    );
  }
}
