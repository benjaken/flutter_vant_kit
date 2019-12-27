import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoActionSheet extends StatefulWidget {
  @override
  _DemoActionSheet createState() => _DemoActionSheet();
}

class _DemoActionSheet extends State<DemoActionSheet> {
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

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
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
          NButton(
            text: "弹出菜单",
            type: "primary",
            onClick: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return ActionSheet(actions: actionList);
                  });
            },
          ),
          title("选项状态"),
          NButton(
            text: "弹出菜单",
            type: "primary",
            onClick: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return ActionSheet(actions: actionList2);
                  });
            },
          ),
          title("展示取消按钮"),
          NButton(
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
                  });
            },
          ),
          title("展示描述信息"),
          NButton(
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
                  });
            },
          ),
          title("展示标题栏"),
          NButton(
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
                  });
            },
          ),
        ],
      ),
    );
  }
}
