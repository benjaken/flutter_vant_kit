import 'package:flutter/material.dart';
import 'package:flutter_kit/utils/index.dart';
import 'package:flutter_kit/widgets/passwordInput.dart';

class demoPasswordInput extends StatefulWidget{
  @override
  _demoPasswordInput createState() => _demoPasswordInput();
}


class _demoPasswordInput extends State<demoPasswordInput> {
  String _value = "123";  

  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title, 
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("基础用法"),
          PasswordInput(
            value: _value,
            info: "密码为 6 位数字",
            onSubmitted: (val) {
              Utils.toast("onSubmitted $val");
            },
          ),
          Title("自定义长度"),
          PasswordInput(
            value: "1234",
            info: "请输入短信验证码",
            length: 4
          ),
          Title("明文展示"),
          PasswordInput(
            value: "12",
            mask: false,
          )
        ],
      )
    );
  }
}