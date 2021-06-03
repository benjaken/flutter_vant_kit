import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoActionSheet extends StatefulWidget {
  @override
  _DemoActionSheet createState() => _DemoActionSheet();
}

class _DemoActionSheet extends State<DemoActionSheet> {
  List<ActionSheetItem> actionList = [
    ActionSheetItem(name: "选项"),
    ActionSheetItem(name: "选项"),
    ActionSheetItem(name: "选项", subname: "基本信息"),
  ];

  List<ActionSheetItem> actionList2 = [
    ActionSheetItem(name: "选项", color: Colors.green),
    ActionSheetItem(loading: true),
    ActionSheetItem(name: "选项", disabled: true),
  ];

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
          CellGroup(
            border: false,
            children: [
              Cell(
                title: "弹出菜单",
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
                title: "展示取消按钮",
                isLink: true,
                onClick: () {
                  ActionSheet(
                    actions: actionList,
                    cancelText: "取消",
                    onCancel: () {
                      Utils.toast("cancel");
                    },
                  ).show(context);
                },
              ),
              Cell(
                title: "展示描述信息",
                isLink: true,
                onClick: () {
                  ActionSheet(
                    actions: actionList,
                    title: "标题",
                    description: "这是一段描述信息",
                  ).show(context);
                },
              ),
            ],
          ),
          title("选项状态"),
          Cell(
            title: "选项状态",
            isLink: true,
            onClick: () {
              ActionSheet(actions: actionList2).show(context);
            },
          ),
          title("自定义面板"),
          Cell(
            title: "自定义面板",
            isLink: true,
            onClick: () {
              ActionSheet(
                child: Container(
                  height: 150,
                  padding: EdgeInsets.all(10),
                  alignment: AlignmentDirectional.topStart,
                  child: Text("data"),
                ),
                title: "标题",
                closeIcon: Icons.highlight_off,
              ).show(context);
            },
          ),
        ],
      ),
    );
  }
}
