import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoRadio extends StatefulWidget {
  @override
  _DemoRadio createState() => _DemoRadio();
}

class _DemoRadio extends State<DemoRadio> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<RadioItem> list = [
      RadioItem(name: "a", text: I18n.of(context)!.radio),
      RadioItem(name: "b", text: I18n.of(context)!.radio),
    ];
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title(I18n.of(context)!.basic_usage),
        RadioGroup(
          value: 'a',
          list: list,
        ),
        title(I18n.of(context)!.disabled_status),
        RadioGroup(list: list, value: 'a', disabled: true),
        title(I18n.of(context)!.custom_color),
        RadioGroup(list: list, value: 'a', checkedColor: Colors.green),
        title(I18n.of(context)!.custom_shape),
        RadioGroup(
          list: list,
          value: 'a',
          shape: 'square',
        ),
        title(I18n.of(context)!.use_with_cell),
        RadioGroup(
          list: list,
          value: 'a',
          inCellGroup: true,
        ),
      ],
    ));
  }
}
