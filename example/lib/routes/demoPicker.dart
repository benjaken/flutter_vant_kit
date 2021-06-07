import 'package:example/generated/i18n.dart';
import 'package:example/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPicker extends StatefulWidget {
  @override
  _DemoPicker createState() => _DemoPicker();
}

class _DemoPicker extends State<DemoPicker> {
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
    dynamic options = [
      PickerItem(I18n.of(context)!.hangzhou),
      PickerItem(I18n.of(context)!.ningbo),
      PickerItem(I18n.of(context)!.wenzhou),
      PickerItem(I18n.of(context)!.jiaxing),
      PickerItem(I18n.of(context)!.huzhou)
    ];

    dynamic options1 = [
      PickerItem(I18n.of(context)!.zhejiang, child: [
        PickerItem(I18n.of(context)!.hangzhou),
        PickerItem(I18n.of(context)!.ningbo),
        PickerItem(I18n.of(context)!.wenzhou),
        PickerItem(I18n.of(context)!.jiaxing),
        PickerItem(I18n.of(context)!.huzhou)
      ]),
      PickerItem(I18n.of(context)!.fujiang, child: [
        PickerItem(I18n.of(context)!.fuzhou),
        PickerItem(I18n.of(context)!.xiamen),
        PickerItem(I18n.of(context)!.putian),
        PickerItem(I18n.of(context)!.sanming),
      ]),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title(I18n.of(context)!.basic_usage),
          Picker(colums: options),
          title(I18n.of(context)!.default_selected),
          Picker(colums: options, defaultIndex: 2),
          title(I18n.of(context)!.show_top_bar),
          Picker(
              colums: options,
              showToolbar: true,
              title: I18n.of(context)!.title,
              onCancel: (values, index) {
                Utils.toast(I18n.of(context)!.cancel);
              },
              onConfirm: (values, index) {
                Utils.toast(I18n.of(context)!.tip_confirm + "$values, $index");
              }),
          title(I18n.of(context)!.use_with_popup),
          Cell(
            title: I18n.of(context)!.city,
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
          title(I18n.of(context)!.multi_column_linkage),
          Picker(
              colums: options1,
              level: 2,
              defaultIndex: [0, 2],
              showToolbar: true,
              title: I18n.of(context)!.title,
              onCancel: (values, index) {
                Utils.toast(I18n.of(context)!.cancel);
              },
              onConfirm: (values, index) {
                Utils.toast(I18n.of(context)!.tip_confirm + "$values, $index");
              }),
          title(I18n.of(context)!.loading_status),
          Picker(colums: options1, level: 2, showToolbar: true, loading: true),
        ],
      ),
    );
  }
}
