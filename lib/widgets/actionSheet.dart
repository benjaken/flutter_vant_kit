import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';

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

  const ActionSheet(
      {Key key,
      this.actions,
      this.title,
      this.cancelText,
      this.description,
      this.round: true,
      this.closeIcon,
      this.onCancel,
      this.onClose,
      this.child})
      : super(key: key);

  buildActionItem(BuildContext context, List<ActionItem> actions) {
    List<Widget> widgets = [];
    if (child != null) return [child];
    for (int i = 0; i < actions.length; i++) {
      ActionItem action = actions[i];
      widgets.add(Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: Style.actionSheetItemHeight,
              color: Style.actionSheetItemBackground,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  action.loading
                      ? SizedBox(
                          width: Style.actionSheetItemFontSize,
                          height: Style.actionSheetItemFontSize,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                Style.actionSheetItemTextColor),
                            backgroundColor: Style.actionSheetItemBackground,
                            strokeWidth: Style.borderWidthBase,
                          ),
                        )
                      : Container(),
                  Text(action.name ?? "",
                      style: TextStyle(
                          fontSize: Style.actionSheetItemFontSize,
                          color: action.disabled
                              ? Style.actionSheetItemDisabledTextColor
                              : action.color ??
                                  Style.actionSheetItemTextColor)),
                  SizedBox(
                      width: action.subname != null ? Style.intervalSm : 0),
                  Text(action.subname ?? "",
                      style: TextStyle(
                          fontSize: Style.actionSheetSubnameFontSize,
                          color: Style.actionSheetSubnameColor)),
                ],
              ),
            ),
            onTap: () {
              if (action.loading || action.disabled) return;
              if (action.onClick != null) action.onClick();
              close(context);
            },
          ),
          (i < actions.length - 1) ? NDivider() : Container()
        ],
      ));
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
              padding: Style.actionSheetHeaderPadding,
              child: Column(
                children: <Widget>[
                  title != null
                      ? Text(title,
                          style: TextStyle(
                              fontSize: Style.actionSheetHeaderFontSize,
                              fontWeight: FontWeight.bold))
                      : Container(),
                  SizedBox(height: Style.intervalSm),
                  description != null
                      ? Text(description,
                          style: TextStyle(
                              fontSize: Style.actionSheetDescriptionFontSize,
                              color: Style.actionSheetDescriptionColor))
                      : Container(),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Padding(
                padding: EdgeInsets.all(Style.actionSheetCloseIconPadding),
                child: GestureDetector(
                  onTap: () {
                    close(context);
                  },
                  child: Icon(closeIcon,
                      color: Style.actionSheetCloseIconColor,
                      size: Style.actionSheetCloseIconSize),
                ),
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
        Container(
            height: Style.actionSheetCancelPaddingTop,
            color: Style.backgroundColor),
        GestureDetector(
          child: Container(
            color: Style.actionSheetItemBackground,
            alignment: AlignmentDirectional.center,
            height: Style.actionSheetItemHeight,
            child: Text(cancelText,
                style: TextStyle(
                    fontSize: Style.actionSheetItemFontSize,
                    color: Style.actionSheetItemTextColor)),
          ),
          onTap: () {
            if (onCancel != null) onCancel();
            close(context);
          },
        )
      ],
    );
  }

  void close(BuildContext context) {
    if (onClose != null) onClose();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    round ? Style.actionSheetHeaderBorderRadius : 0)),
            color: Style.actionSheetItemBackground),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (title != null || description != null)
                ? buildTitleItem(context)
                : Container(),
            ...buildActionItem(context, actions),
            (cancelText != null) ? buildCancelItem(context) : Container()
          ],
        ));
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

  ActionItem(
      {this.name,
      this.subname,
      this.color: Colors.black,
      this.loading: false,
      this.disabled: false,
      this.onClick});
}
