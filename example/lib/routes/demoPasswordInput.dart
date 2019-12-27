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
        title("基础用法"),
        PasswordInput(
          value: _value,
          info: "密码为 6 位数字",
          onSubmitted: (val) {
            Utils.toast("onSubmitted $val");
          },
        ),
        title("自定义长度"),
        PasswordInput(value: "1234", info: "请输入短信验证码", length: 4),
        title("明文展示"),
        PasswordInput(
          value: "12",
          mask: false,
        )
      ],
    ));
  }
}
