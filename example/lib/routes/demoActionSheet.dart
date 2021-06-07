import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoActionSheet extends StatefulWidget {
  @override
  _DemoActionSheet createState() => _DemoActionSheet();
}

class _DemoActionSheet extends State<DemoActionSheet> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ActionSheetItem> actionList = [
      ActionSheetItem(name: I18n.of(context)!.option),
      ActionSheetItem(name: I18n.of(context)!.option),
      ActionSheetItem(
          name: I18n.of(context)!.option,
          subname: I18n.of(context)!.basic_info),
    ];

    List<ActionSheetItem> actionList2 = [
      ActionSheetItem(name: I18n.of(context)!.option, color: Colors.green),
      ActionSheetItem(loading: true),
      ActionSheetItem(name: I18n.of(context)!.option, disabled: true),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title(I18n.of(context)!.basic_usage),
          CellGroup(
            border: false,
            children: [
              Cell(
                title: I18n.of(context)!.basic_usage,
                isLink: true,
                onClick: () {
                  ActionSheet(
                      actions: actionList,
                      onSelect: (action, index, context) {
                        Utils.toast(action.name!);
                      }).show(context);
                },
              ),
              Cell(
                title: I18n.of(context)!.show_cancel_button,
                isLink: true,
                onClick: () {
                  ActionSheet(
                    actions: actionList,
                    cancelText: I18n.of(context)!.cancel,
                    onCancel: () {
                      Utils.toast(I18n.of(context)!.cancel);
                    },
                  ).show(context);
                },
              ),
              Cell(
                title: I18n.of(context)!.show_description,
                isLink: true,
                onClick: () {
                  ActionSheet(
                    actions: actionList,
                    title: I18n.of(context)!.title,
                    description: I18n.of(context)!.description,
                  ).show(context);
                },
              ),
            ],
          ),
          title(I18n.of(context)!.option_status),
          Cell(
            title: I18n.of(context)!.option_status,
            isLink: true,
            onClick: () {
              ActionSheet(actions: actionList2).show(context);
            },
          ),
          title(I18n.of(context)!.custom_panel),
          Cell(
            title: I18n.of(context)!.custom_panel,
            isLink: true,
            onClick: () {
              ActionSheet(
                child: Container(
                  height: 150,
                  padding: EdgeInsets.all(10),
                  alignment: AlignmentDirectional.topStart,
                  child: Text("data"),
                ),
                title: I18n.of(context)!.title,
                closeIcon: Icons.highlight_off,
              ).show(context);
            },
          ),
        ],
      ),
    );
  }
}
