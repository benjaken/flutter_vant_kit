import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/divider.dart';

class ActionSheet extends StatelessWidget {
  // 菜单选项	
  final List<ActionItem> actions;
  // 顶部标题	
  final String title;
  // 取消按钮文字	
  final String cancelText;
  // 选项上方的描述信息	
  final String description;
  // 是否显示圆角	
  final bool round;
  // 关闭图标
  final IconData closeIcon;
  // 取消按钮点击时触发	
  final Function onCancel;
  // 关闭菜单时触发	
  final Function onClose;
  // 自定义菜单内容
  final Widget child;

  const ActionSheet({
    Key key,
    this.actions,
    this.title,
    this.cancelText,
    this.description,
    this.round: true,
    this.closeIcon,
    this.onCancel,
    this.onClose,
    this.child
  }) : super(key: key);

  buildActionItem (BuildContext context,List<ActionItem> actions) {
    List<Widget> widgets = [];
    if (child != null) return [child];
    for (int i = 0; i < actions.length; i++) {
      ActionItem action = actions[i];
      widgets.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    action.loading ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.grey),
                        backgroundColor: Colors.white,
                        strokeWidth: 1,
                      ),
                    ) : Container(),
                    Text(action.name??"", style: TextStyle(fontSize: 16, color: action.disabled ? Colors.grey : action.color)),
                    SizedBox(width: action.subname != null ? 6 : 0),
                    Text(action.subname??"", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                onTap: () {
                  if (action.loading || action.disabled) return;
                  if (action.onClick != null) action.onClick(); 
                  close(context);
                },
              ),
            ),
            (i < actions.length -1) ? NDivider() : Container()
          ],
        )
      );
    }
    return widgets;
  }

  Widget buildTitleItem(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: <Widget>[
                  title != null ? Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)) : Container(),
                  SizedBox(height: 4),
                  description != null ? Text(description, style: TextStyle(fontSize: 12, color: Colors.grey)) : Container(),
                ],
              ),
            ),
            Positioned(
              right: 20,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  close(context);
                },
                child: Icon(closeIcon, color: Colors.grey),
              ),
            )
          ],
        ),
        NDivider()
      ],
    );
  }

  Widget buildCancelItem(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(height: 10, color: Color(0xffebedf0)),
        GestureDetector(
          child: Container(
            color: Colors.white,
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(cancelText, style: TextStyle(fontSize: 16, color: Colors.black)),
          ),
          onTap: () {
            if (onCancel != null) onCancel();
            close(context);
          },
        )
      ],
    );
  }

  void close (BuildContext context) {
    if (onClose != null) onClose();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(round ? 20.0 : 0)),
        color: Colors.white
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          (title != null || description != null) ? buildTitleItem(context) : Container(),
          ...buildActionItem(context, actions),
          (cancelText != null) ? buildCancelItem(context) : Container()
        ],
      )
    );
  }
}

class ActionItem {
  // 标题	
  final String name;
  // 二级标题	
  final String subname;
  // 选项文字颜色	
  final Color color;
  // 是否为加载状态	
  final bool loading;
  // 是否为禁用状态	
  final bool disabled;
  // 选中选项时触发，禁用或加载状态下不会触发
  final Function onClick;

  ActionItem({
    this.name,
    this.subname,
    this.color: Colors.black,
    this.loading: false,
    this.disabled: false,
    this.onClick
  });
}