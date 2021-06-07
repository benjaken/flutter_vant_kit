import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoField extends StatefulWidget {
  @override
  _DemoField createState() => _DemoField();
}

class _DemoField extends State<DemoField> {
  var testInput1 = TextEditingController();
  var testInput2 = TextEditingController(text: "test");
  var testInput3 = TextEditingController();
  var testInput4 = TextEditingController();
  var testInput5 = TextEditingController();
  var testInput6 = TextEditingController();
  var testInput7 = TextEditingController();
  var testInput8 = TextEditingController();

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  bool isEmptyName(String text) {
    return text == "";
  }

  bool isErrorPhone(String text) {
    String patttern = r'(^([1][3,4,5,6,7,8,9])\d{9}$)';
    return !(new RegExp(patttern).hasMatch(text));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title(I18n.of(context)!.basic_usage),
          CellGroup(
            children: <Widget>[
              Field(
                placeholder: I18n.of(context)!.placeholder_username,
                controller: testInput1,
                onChange: (val) {
                  Utils.toast("text changed: $val");
                },
                onSubmitted: (val) {
                  Utils.toast("submitted: $val");
                },
              )
            ],
          ),
          title(I18n.of(context)!.custom_type),
          CellGroup(children: <Widget>[
            Field(
              label: I18n.of(context)!.username,
              placeholder: I18n.of(context)!.placeholder_username,
              controller: testInput2,
              maxLength: 10,
              clearable: true,
              rightIcon: Icons.help_outline,
              require: true,
              clickRight: () async {
                Utils.toast("Click Right!");
              },
            ),
            Field(
                label: I18n.of(context)!.password,
                placeholder: I18n.of(context)!.placeholder_password,
                controller: testInput3,
                require: true,
                type: "password"),
          ]),
          title(I18n.of(context)!.disabled_field),
          CellGroup(
            children: <Widget>[
              Field(
                label: I18n.of(context)!.username,
                placeholder: I18n.of(context)!.placeholder_disabled_field,
                disabled: true,
                controller: testInput4,
                leftIcon: Icons.perm_identity,
                clickLeft: () async {
                  Utils.toast("click left");
                },
              )
            ],
          ),
          title(I18n.of(context)!.error_tip),
          CellGroup(
            children: <Widget>[
              Field(
                label: I18n.of(context)!.username,
                placeholder: I18n.of(context)!.placeholder_username,
                error: isEmptyName(testInput5.text),
                controller: testInput5,
                maxLength: 10,
                clearable: true,
                onChange: (val) {
                  setState(() {
                    testInput5.text = val;
                  });
                },
              ),
              Field(
                label: I18n.of(context)!.mobile,
                placeholder: I18n.of(context)!.placeholder_mobile,
                controller: testInput6,
                errorMessage: isErrorPhone(testInput6.text)
                    ? I18n.of(context)!.error_mobile
                    : null,
                maxLength: 11,
                clearable: true,
                onChange: (val) {
                  setState(() {
                    testInput6.text = val;
                  });
                },
              ),
            ],
          ),
          title(I18n.of(context)!.insert_button),
          CellGroup(
            children: <Widget>[
              Field(
                label: I18n.of(context)!.code,
                placeholder: I18n.of(context)!.placeholder_code,
                controller: testInput7,
                right: NButton(
                  text: I18n.of(context)!.send_code,
                  type: "primary",
                  size: "small",
                  onClick: () => {},
                ),
              ),
            ],
          ),
          title(I18n.of(context)!.show_word_count),
          CellGroup(
            children: <Widget>[
              Field(
                  label: I18n.of(context)!.comment,
                  placeholder: I18n.of(context)!.placeholder_comment,
                  controller: testInput8,
                  type: "textarea",
                  rows: 5,
                  maxLength: 100,
                  showWordLimit: true),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
