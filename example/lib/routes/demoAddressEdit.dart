import 'package:example/generated/i18n.dart';
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
          title(I18n.of(context)!.basic_usage),
          AddressEdit(
            showDelete: true,
            showSetDefault: true,
            addressInfo: {
              "name": I18n.of(context)!.example_name,
              "tel": "18345234123",
              "province": I18n.of(context)!.example_province,
              "city": I18n.of(context)!.example_city,
              "county": I18n.of(context)!.example_county,
              "provinceId": 0,
              "cityId": 1,
              "countyId": 0,
              "addressDetail": I18n.of(context)!.example_address,
              "postalCode": "515000",
              "isDefault": true
            },
            children: <Widget>[
              Field(
                label: I18n.of(context)!.remark,
                placeholder: I18n.of(context)!.placeholder_remark,
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
