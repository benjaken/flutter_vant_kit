import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoAddressList extends StatefulWidget {
  @override
  _DemoAddressList createState() => _DemoAddressList();
}

class _DemoAddressList extends State<DemoAddressList> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<AddressInfo> list = [
      AddressInfo(
          name: "张三",
          tel: "18345234123",
          province: "广东省",
          city: "深圳市",
          county: "南山区",
          addressDetail: "明珠花园",
          postalCode: "515000",
          isDefault: true),
      AddressInfo(
          name: "李四",
          tel: "18345234123",
          province: "广东省",
          city: "深圳市",
          county: "南山区",
          addressDetail: "白石街道明珠花园",
          postalCode: "515000",
          isDefault: false),
    ];
    List<AddressInfo> disabledList = [
      AddressInfo(
          name: "王五",
          tel: "18345234123",
          province: "广东省",
          city: "深圳市",
          county: "南山区",
          addressDetail: "明珠花园",
          postalCode: "515000",
          isDefault: false)
    ];

    return AddressList(
      id: 0,
      list: list,
      top: title("基本用法"),
      disabledList: disabledList,
      onSelect: (item, i) {
        Utils.toast(item.toString());
      },
      onEdit: (item, i) {
        Utils.toast("edit");
      },
      onAdd: () {
        Utils.toast('add');
      },
    );
  }
}
