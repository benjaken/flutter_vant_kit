import 'package:example/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPicker extends StatefulWidget {
  @override
  _DemoPicker createState() => _DemoPicker();
}

class _DemoPicker extends State<DemoPicker> {
  dynamic options = [
    PickerItem("杭州"),
    PickerItem("宁波"),
    PickerItem("温州"),
    PickerItem("嘉兴"),
    PickerItem("湖州"),
  ];

  dynamic options1 = [
    PickerItem("浙江", child: [
      PickerItem("杭州"),
      PickerItem("宁波"),
      PickerItem("温州"),
      PickerItem("嘉兴"),
      PickerItem("湖州"),
    ]),
    PickerItem("福建", child: [
      PickerItem("福州"),
      PickerItem("厦门"),
      PickerItem("莆田"),
      PickerItem("三明"),
      // PickerItem("泉州"),
    ]),
  ];

  String? _city;
  int? _cityId;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
          Picker(colums: options),
          title("默认选中项"),
          Picker(colums: options, defaultIndex: 2),
          title("展示顶部栏"),
          Picker(
              colums: options,
              showToolbar: true,
              title: "标题",
              onCancel: (values, index) {
                Utils.toast("取消");
              },
              onConfirm: (values, index) {
                Utils.toast("确认，选项为 $values, $index");
              }),
          title("搭配弹出层使用"),
          Cell(
            title: "城市",
            isLink: true,
            value: _city,
            onClick: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Picker(
                      colums: options,
                      defaultIndex: _cityId,
                      showToolbar: true,
                      onConfirm: (values, index) {
                        setState(() {
                          _city = values.join('');
                          _cityId = index;
                        });
                        Navigator.of(context).pop();
                      },
                      onCancel: (values, index) {
                        Navigator.of(context).pop();
                      },
                    );
                  });
            },
          ),
          title("多列联动"),
          Picker(
              colums: options1,
              level: 2,
              defaultIndex: [0, 2],
              showToolbar: true,
              title: "标题",
              onCancel: (values, index) {
                Utils.toast("取消");
              },
              onConfirm: (values, index) {
                Utils.toast("确认，选项为 $values, $index");
              }),
          title("加载状态"),
          Picker(colums: options1, level: 2, showToolbar: true, loading: true),
        ],
      ),
    );
  }
}
