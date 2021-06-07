import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCheckbox extends StatefulWidget {
  @override
  _DemoCheckbox createState() => _DemoCheckbox();
}

class _DemoCheckbox extends State<DemoCheckbox> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<CheckItem> list = [
      CheckItem(name: "a", text: I18n.of(context)!.checkbox)
    ];

    List<CheckItem> list2 = [
      CheckItem(name: "a", text: I18n.of(context)!.checkbox),
      CheckItem(name: "b", text: I18n.of(context)!.checkbox),
      CheckItem(
          name: "c",
          text: I18n.of(context)!.checkbox,
          checkedColor: Colors.green),
      CheckItem(name: "d", text: I18n.of(context)!.checkbox, disabled: true),
    ];

    List<CheckItem> list3 = [
      CheckItem(name: "a", text: I18n.of(context)!.checkbox),
      CheckItem(name: "b", text: I18n.of(context)!.checkbox),
      CheckItem(name: "c", text: I18n.of(context)!.checkbox),
    ];
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title(I18n.of(context)!.basic_usage),
        CheckboxGroup(
          list: list,
          values: ["a"],
          onChange: (list) {
            Utils.toast(list.toString());
          },
        ),
        title(I18n.of(context)!.disabled_status),
        CheckboxGroup(
          list: list,
          values: ["a"],
          disabled: true,
        ),
        title(I18n.of(context)!.custom_shape),
        CheckboxGroup(
          list: list,
          values: ["a"],
          shape: "square",
        ),
        title(I18n.of(context)!.custom_color),
        CheckboxGroup(
          list: list,
          values: ["a"],
          checkedColor: Colors.green,
        ),
        title(I18n.of(context)!.checkbox_group),
        CheckboxGroup(
          list: list2,
          values: ["a", "b"],
        ),
        title(I18n.of(context)!.max_count),
        CheckboxGroup(
          list: list3,
          values: ["a"],
          max: 2,
        ),
        title(I18n.of(context)!.cell_component),
        CheckboxGroup(
          list: list3,
          values: ['a'],
          inCellGroup: true,
        ),
        SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
