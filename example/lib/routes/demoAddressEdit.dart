import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoAddressEdit extends StatefulWidget {
  @override
  _DemoAddressEdit createState() => _DemoAddressEdit();
}

class _DemoAddressEdit extends State<DemoAddressEdit> {
  var textController = TextEditingController();

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
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
          AddressEdit(
            showDelete: true,
            showSetDefault: true,
            addressInfo: {
              "name": "张三",
              "tel": "18345234123",
              "province": "广东省",
              "city": "深圳市",
              "county": "南山区",
              "provinceIndex": 0,
              "cityIndex": 1,
              "countyIndex": 0,
              "addressDetail": "明珠花园5栋304房",
              "postalCode": "515000",
              "isDefault": true
            },
            children: <Widget>[
              Field(
                label: "备注",
                placeholder: "请输入备注",
                controller: textController,
              )
            ],
            onSave: (map) {
              Utils.toast("Saved! ${map.toString()}");
            },
          )
        ],
      ),
    );
  }
}
