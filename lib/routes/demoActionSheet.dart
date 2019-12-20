import 'package:flutter/material.dart';
import 'package:flutter_kit/utils/index.dart';

import 'package:flutter_kit/widgets/button.dart';
import 'package:flutter_kit/widgets/actionSheet.dart';

class demoActionSheet extends StatefulWidget {
  @override
  _demoActionSheet createState() => _demoActionSheet();
}

class _demoActionSheet extends State<demoActionSheet> {
  List<ActionItem> actionList = [
    ActionItem(name: "选项"),
    ActionItem(name: "选项"),
    ActionItem(name: "选项", subname: "基本信息"),
  ];

  List<ActionItem> actionList2 = [
    ActionItem(name: "选项", color: Colors.green),
    ActionItem(loading: true),
    ActionItem(name: "选项", disabled: true),
  ];

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
          CustomButton(
            text: "弹出菜单",
            type: "primary",
            onClick: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return ActionSheet(
                    actions: actionList
                  );
                }
              );
            },
          ),
          Title("选项状态"),
          CustomButton(
            text: "弹出菜单",
            type: "primary",
            onClick: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return ActionSheet(
                    actions: actionList2
                  );
                }
              );
            },
          ),
          Title("展示取消按钮"),
          CustomButton(
            text: "弹出菜单",
            type: "primary",
            onClick: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return ActionSheet(
                    actions: actionList,
                    cancelText: "取消",
                    onCancel: () {
                      Utils.toast("cancel");
                    },
                  );
                }
              );
            },
          ),
          Title("展示描述信息"),
          CustomButton(
            text: "弹出菜单",
            type: "primary",
            onClick: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return ActionSheet(
                    actions: actionList,
                    title: "标题",
                    description: "这是一段描述信息",
                  );
                }
              );
            },
          ),
          Title("展示标题栏"),
          CustomButton(
            text: "弹出菜单",
            type: "primary",
            onClick: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return ActionSheet(
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(10),
                      alignment: AlignmentDirectional.topStart,
                      child: Text("data"),
                    ),
                    title: "标题",
                    closeIcon: Icons.highlight_off,
                  );
                }
              );
            },
          ),
        ],
      ),
    );
  }
}