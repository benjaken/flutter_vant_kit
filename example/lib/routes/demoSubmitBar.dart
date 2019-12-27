import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoSubmitBar extends StatefulWidget {
  @override
  _DemoSubmitBar createState() => _DemoSubmitBar();
}

class _DemoSubmitBar extends State<DemoSubmitBar> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
          SubmitBar(buttonText: "提交订单", price: 30.50),
          title("禁用状态"),
          SubmitBar(
            buttonText: "提交订单",
            price: 30.50,
            tip: "你的收货地址不支持同城送，我们已为你推荐快递",
            tipIcon: Icons.error_outline,
            disabled: true,
          ),
          title("加载状态"),
          SubmitBar(
            buttonText: "提交订单",
            price: 30.50,
            loading: true,
          ),
          title("高级用法"),
          SubmitBar(
            buttonText: "提交订单",
            price: 30.50,
            tip: "你的收货地址不支持同城送，",
            customTip: GestureDetector(
              onTap: () {
                Utils.toast("Clicked Tip");
              },
              child: Text("修改地址",
                  style: TextStyle(fontSize: 12, color: Colors.blueAccent)),
            ),
            customLeft: NCheckbox(text: "全选", value: true),
          ),
        ]));
  }
}
