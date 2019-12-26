import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';

class Search extends StatefulWidget {
  // 搜索框形状
  final String shape;
  // 搜索框背景色
  Color background;
  // 输入的最大字符数
  final int maxLength;
  // 占位提示文字
  final String placeholder;
  // 是否启用清除控件
  final bool clearable;
  // 是否在搜索框右侧显示取消按钮
  final bool showAction;
  // 取消按钮文字
  final String actionText;
  // 是否禁用输入框
  final bool disabled;
  // 是否将输入框设为只读
  final bool readonly;
  // 输入框左侧图标
  final IconData leftIcon;
  // 输入框右侧图标
  final IconData rightIcon;
  // 自定义左侧内容
  final Widget left;
  // 自定义右侧内容
  final Widget right;
  // 点击左侧内容反馈
  final Function() onClickLeft;
  // 点击右侧内容反馈
  final Function() onClickRight;
  // 点击提交按钮反馈
  final Function(String val) onSubmitted;
  // 点击取消按钮反馈
  final Function() onCancel;

  Search(
      {Key key,
      this.shape: "square",
      this.background,
      this.maxLength: 100,
      this.placeholder: "请输入搜索关键词",
      this.clearable: true,
      this.showAction: false,
      this.actionText: "取消",
      this.disabled: false,
      this.readonly: false,
      this.leftIcon: Icons.search,
      this.rightIcon,
      this.left,
      this.right,
      this.onClickLeft,
      this.onClickRight,
      this.onCancel,
      this.onSubmitted})
      : super(key: key);

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  TextEditingController _controller = TextEditingController();

  Widget buildInput() {
    return Row(
      children: <Widget>[
        Padding(
          padding: Style.searchLabelPadding,
          child: widget.left != null
              ? widget.left
              : GestureDetector(
                  child: Icon(widget.leftIcon,
                      size: Style.searchLabelFontSize,
                      color: Style.searchLeftIconColor),
                  onTap: () {
                    if (widget.onClickLeft != null) widget.onClickLeft();
                  },
                ),
        ),
        // (widget.left != null || widget.leftIcon != null) ? SizedBox(width: 6) : Container(),
        Expanded(
          child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              readOnly: widget.readonly,
              enabled: !widget.disabled,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: Style.searchInputPlaceholderColor,
                  fontSize: Style.searchInputFontSize,
                ),
                counterText: "",
                border: InputBorder.none,
              ),
              maxLength: widget.maxLength,
              cursorColor: Style.searchInputColor,
              cursorWidth: 1.0,
              onSubmitted: (val) {
                if (widget.onSubmitted != null) widget.onSubmitted(val);
              }),
        ),
        widget.rightIcon != null
            ? Padding(
                padding: Style.searchLabelPadding,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(widget.rightIcon,
                          size: Style.searchLabelFontSize,
                          color: Style.searchLabelColor),
                      onTap: () {
                        if (widget.onClickRight != null) widget.onClickRight();
                      },
                    )
                  ],
                ),
              )
            : Container()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.background = widget.background ?? Style.searchInputBackgroundColor;
    return Container(
        color: Style.searchBackgroundColor,
        padding: Style.searchPadding,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      widget.shape == 'round' ? Style.borderRadiusMax : 0),
                  color: widget.background,
                ),
                child: buildInput(),
              ),
            ),
            widget.showAction
                ? Padding(
                    padding: Style.searchActionPadding,
                    child: widget.right != null
                        ? widget.right
                        : GestureDetector(
                            onTap: () {
                              if (widget.onCancel != null) widget.onCancel();
                            },
                            child: Text(widget.actionText,
                                style: TextStyle(
                                    fontSize: Style.searchActionFontSize,
                                    color: Style.searchActionTextColor)),
                          ),
                  )
                : Container()
          ],
        ));
  }
}
