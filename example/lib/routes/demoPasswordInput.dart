import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPasswordInput extends StatefulWidget {
  @override
  _DemoPasswordInput createState() => _DemoPasswordInput();
}

class _DemoPasswordInput extends State<DemoPasswordInput> {
  String _value = "123";

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
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
        PasswordInput(
          value: _value,
          info: I18n.of(context)!.tip_password,
          onSubmitted: (val) {
            Utils.toast("onSubmitted $val");
          },
        ),
        title(I18n.of(context)!.custom_length),
        PasswordInput(
            value: "1234", info: I18n.of(context)!.placeholder_code, length: 4),
        title(I18n.of(context)!.clear_text_display),
        PasswordInput(
          value: "12",
          mask: false,
        )
      ],
    ));
  }
}
