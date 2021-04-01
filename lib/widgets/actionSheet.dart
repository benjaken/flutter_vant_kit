import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

import 'package:flutter_vant_kit/widgets/divider.dart';

class ActionSheet {
  // 菜单选项
  final List<ActionSheetItem>? actions;
  // 顶部标题
  final String? title;
  // 取消按钮文字
  final String? cancelText;
  // 选项上方的描述信息
  final String? description;
  // 是否显示圆角
  final bool round;
  // 关闭图标
  final IconData? closeIcon;
  // 是否在点击遮罩层后关闭
  final bool closeOnClickOverlay;
  // 选中选项时触发，禁用或加载状态下不会触发
  final Function(ActionSheetItem actionSheetItem, int index, BuildContext context)? onSelect;
  // 取消按钮点击时触发
  final Function()? onCancel;
  // 关闭菜单时触发
  final Function()? onClose;
  // 自定义菜单内容
  final Widget? child;

  const ActionSheet(
      {Key? key,
      this.actions,
      this.title,
      this.cancelText,
      this.description,
      this.round: true,
      this.closeIcon,
      this.closeOnClickOverlay: true,
      this.onSelect,
      this.onCancel,
      this.onClose,
      this.child});

  show(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isDismissible: closeOnClickOverlay,
        builder: (BuildContext context) {
          return ActionSheetState(this);
        });
  }
}

class ActionSheetState extends StatelessWidget {
  final ActionSheet actionSheet;

  const ActionSheetState(this.actionSheet);

  List<Widget> buildActionSheetItemContent(ActionSheetItem action) {
    return [
      action.loading
          ? SizedBox(
              width: Style.actionSheetItemFontSize,
              height: Style.actionSheetItemFontSize,
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(Style.actionSheetItemTextColor),
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
                  : action.color)),
      SizedBox(width: action.subname != null ? Style.intervalSm : 0),
      Text(action.subname ?? "",
          style: TextStyle(
              fontSize: Style.actionSheetSubnameFontSize,
              color: Style.actionSheetSubnameColor))
    ];
  }

  buildActionSheetItem(BuildContext context, List<ActionSheetItem>? actions) {
    List<Widget> widgets = [];
    if (actionSheet.child != null) return [actionSheet.child];
    for (int i = 0; i < actions!.length; i++) {
      ActionSheetItem action = actions[i];
      widgets.add(Column(
        children: <Widget>[
          DecoratedBox(
              decoration: BoxDecoration(
                color: Style.actionSheetItemBackground,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  focusColor: (action.disabled || action.loading)
                      ? Style.transparent
                      : Theme.of(context).focusColor,
                  highlightColor: (action.disabled || action.loading)
                      ? Style.transparent
                      : Theme.of(context).highlightColor,
                  hoverColor: (action.disabled || action.loading)
                      ? Style.transparent
                      : Theme.of(context).hoverColor,
                  splashColor: (action.disabled || action.loading)
                      ? Style.transparent
                      : Theme.of(context).splashColor,
                  child: Container(
                    height: Style.actionSheetItemHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildActionSheetItemContent(action),
                    ),
                  ),
                  onTap: () {
                    if (action.loading || action.disabled) return;
                    if (actionSheet.onSelect != null)
                      actionSheet.onSelect!(action, i, context);
                    close(context);
                  },
                ),
              )),
          i < actions.length ? NDivider(hairline: true) : Container()
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
                  actionSheet.title != null
                      ? Text(actionSheet.title!,
                          style: TextStyle(
                              fontSize: Style.actionSheetHeaderFontSize,
                              fontWeight: FontWeight.bold))
                      : Container(),
                  SizedBox(height: Style.intervalSm),
                  actionSheet.description != null
                      ? Text(actionSheet.description!,
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
                  child: Icon(actionSheet.closeIcon,
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
        DecoratedBox(
          decoration: BoxDecoration(
            color: Style.actionSheetItemBackground,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              child: Container(
                alignment: AlignmentDirectional.center,
                height: Style.actionSheetItemHeight,
                child: Text(actionSheet.cancelText!,
                    style: TextStyle(
                        fontSize: Style.actionSheetItemFontSize,
                        color: Style.actionSheetItemTextColor)),
              ),
              onTap: () {
                if (actionSheet.onCancel != null) actionSheet.onCancel!();
                close(context);
              },
            ),
          ),
        ),
        NDivider(hairline: true)
      ],
    );
  }

  void close(BuildContext context) {
    if (actionSheet.onClose != null) actionSheet.onClose!();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(actionSheet.round
                    ? Style.actionSheetHeaderBorderRadius
                    : 0)),
            color: Style.actionSheetItemBackground),
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (actionSheet.title != null || actionSheet.description != null)
                ? buildTitleItem(context)
                : Container(),
            ...buildActionSheetItem(context, actionSheet.actions),
            (actionSheet.cancelText != null)
                ? buildCancelItem(context)
                : Container()
          ],
        )));
  }
}

class ActionSheetItem {
  // 标题
  final String? name;
  // 二级标题
  final String? subname;
  // 选项文字颜色
  final Color color;
  // 是否为加载状态
  final bool loading;
  // 是否为禁用状态
  final bool disabled;

  ActionSheetItem(
      {this.name,
      this.subname,
      this.color: Colors.black,
      this.loading: false,
      this.disabled: false});
}
