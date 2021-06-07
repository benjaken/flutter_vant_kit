import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoNumberKeyboard extends StatefulWidget {
  @override
  _DemoNumberKeyboard createState() => _DemoNumberKeyboard();
}

class _DemoNumberKeyboard extends State<DemoNumberKeyboard> {
  TextEditingController testInput = TextEditingController();

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
        NButton(
          text: I18n.of(context)!.show_default_keyboard,
          type: "primary",
          onClick: () {
            NumberKeyboard(
              title: I18n.of(context)!.default_keyboard,
              closeButtomText: I18n.of(context)!.finish,
              extraKey: ".",
            ).show(context);
          },
        ),
        title(I18n.of(context)!.two_way_binding),
        Field(
          placeholder: I18n.of(context)!.placeholder_input,
          controller: testInput,
          readonly: true,
          onClick: () {
            NumberKeyboard(
                value: testInput.text,
                maxlength: 6,
                closeButtomText: I18n.of(context)!.finish,
                extraKey: ".",
                onChange: (String val) {
                  setState(() {
                    testInput.text = val;
                  });
                }).show(context);
          },
        ),
      ],
    ));
  }
}
