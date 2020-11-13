import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Field extends StatefulWidget {
  // 控制属性
  final TextEditingController controller;
  // 输入类型
  final TextInputType keyboardType;
  // 焦点控制
  final FocusNode focusNode;
  // 键盘右下角的类型
  final TextInputAction textInputAction;
  // 输入框左侧文本
  final String label;
  // 输入的最大字符数
  final int maxLength;
  // 占位提示文字
  final String placeholder;
  // 是否禁用输入框
  final bool disabled;
  // 是否只读
  final bool readonly;
  // 是否显示表单必填星号
  final bool require;
  // 是否启用清除控件
  final bool clearable;
  // 自动聚焦
  final bool autofocus;
  // 检验输入框正则
  final List<TextInputFormatter> inputFormatters;
  // 输入框类型
  final String type;
  // 输入框行数，当type=textarea可用
  final int rows;
  // 显示字数统计
  final bool showWordLimit;
  // 是否将输入内容标红
  final bool error;
  // 底部错误提示文案
  final String errorMessage;
  // 左侧文本宽度
  final double labelWidth;
  // 左侧文本对齐方式
  final TextAlign labelAlign;
  // 输入框内容对齐方式
  final TextAlign inputAlign;
  // 左侧图标
  final IconData leftIcon;
  // 点击左侧图标时触发
  final Function() clickLeft;
  // 右侧图标
  final IconData rightIcon;
  // 点击右侧图标时触发
  final Function() clickRight;
  // 自定义右侧内容
  final Widget right;
  // 工具栏定制
  final ToolbarOptions toolbarOptions;
  // 输入框内容变化时触发
  final Function(String val) onChange;
  // 输入框内容编辑结束时触发
  final Function() onEditingComplete;
  // 输入框获得焦点时触发
  final Function() onClick;
  // 内容提交(按回车)的回调
  final Function(String val) onSubmitted;
  // 文本样式
  final TextStyle style;

  Field({
    Key key,
    this.keyboardType,
    this.focusNode,
    this.textInputAction: TextInputAction.done,
    this.label,
    this.placeholder,
    this.controller,
    this.maxLength,
    this.disabled: false,
    this.readonly: false,
    this.require: false,
    this.clearable: true,
    this.autofocus: false,
    this.inputFormatters,
    this.type: "text",
    this.rows: 2,
    this.showWordLimit: false,
    this.error: false,
    this.errorMessage,
    this.labelWidth: Style.fieldLabelWidth,
    this.labelAlign: TextAlign.start,
    this.inputAlign: TextAlign.start,
    this.leftIcon,
    this.clickLeft,
    this.rightIcon,
    this.clickRight,
    this.right,
    this.toolbarOptions,
    this.onChange,
    this.onEditingComplete,
    this.onSubmitted,
    this.onClick,
    this.style,
  }) : super(key: key);

  @override
  _Field createState() => _Field();
}

class _Field extends State<Field> {
  bool _isShowPwd = false;
  bool _isShowDelete;

  @override
  void initState() {
    super.initState();

    /// 获取初始化值
    _isShowDelete = widget.controller.text.isNotEmpty;

    /// 监听输入改变
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {
          _isShowDelete = widget.controller.text.isNotEmpty;
        });
      }
    });
  }

  Widget buildLeft() {
    return Container(
      width: widget.labelWidth,
      height: Style.fieldMinHeight,
      child: Row(
        children: <Widget>[
          widget.require
              ? Text("*",
                  style: TextStyle(
                    fontSize: Style.fieldFontSize,
                    color: Style.fieldRequiredColor,
                  ))
              : Container(),
          widget.leftIcon != null
              ? GestureDetector(
                  child: Icon(widget.leftIcon, size: Style.fieldIconSize),
                  onTap: () => widget.clickLeft(),
                )
              : Container(),
          widget.leftIcon != null
              ? SizedBox(width: Style.intervalSm)
              : Container(),
          widget.label != null
              ? Flexible(child: Text("${widget.label}",
                  textAlign: widget.labelAlign,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: Style.fieldFontSize)))
              : Container()
        ],
      ),
    );
  }

  Widget buildTextField() {
    return Expanded(
        child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            textAlign: widget.inputAlign,
            autofocus: widget.autofocus,
            readOnly: widget.readonly,
            enabled: !widget.disabled,
            maxLines: widget.type == "textarea" ? widget.rows : 1,
            style: widget.style ??
                TextStyle(
                    fontSize: Style.fieldFontSize,
                    color: widget.error
                        ? Style.fieldInputErrorTextColor
                        : widget.disabled
                            ? Style.fieldInputDisabledTextColor
                            : Style.fieldInputTextColor),
            inputFormatters: widget.inputFormatters,
            obscureText: widget.type == "password" ? !_isShowPwd : false,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: Style.fieldInputPadding,
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                color: widget.error
                    ? Style.fieldInputErrorTextColor
                    : Style.fieldPlaceholderTextColor,
                fontSize: Style.fieldFontSize,
              ),
              counterText: widget.type != "textarea" ? "" : null,
              border: InputBorder.none,
              errorText: widget.errorMessage,
              errorStyle: TextStyle(
                  fontSize: Style.fieldErrorMessageTextSize,
                  color: Style.fieldRequiredColor),
            ),
            maxLength: widget.maxLength,
            toolbarOptions: widget.toolbarOptions,
            cursorColor: widget.error
                ? Style.fieldRequiredColor
                : Style.fieldInputTextColor,
            cursorWidth: Style.fieldInputCursorWidth,
            onChanged: (val) {
              if (widget.onChange != null) widget.onChange(val);
            },
            onTap: () {
              if (widget.onClick != null) widget.onClick();
            },
            onFieldSubmitted: (val) {
              if (widget.onSubmitted != null) widget.onSubmitted(val);
            }));
  }

  Widget buildRight() {
    return Container(
      height: Style.fieldMinHeight,
      child: Row(
        children: <Widget>[
          widget.type == "password"
              ? SizedBox(width: Style.intervalMd)
              : Container(),
          widget.type == "password"
              ? GestureDetector(
                  child: Icon(
                      _isShowPwd ? Icons.visibility_off : Icons.visibility,
                      size: Style.fieldIconSize,
                      color: Style.fieldRightIconColor),
                  onTap: () {
                    setState(() {
                      _isShowPwd = !_isShowPwd;
                    });
                  },
                )
              : Container(),
          widget.clearable && _isShowDelete
              ? SizedBox(width: Style.intervalMd)
              : Container(),
          widget.clearable && _isShowDelete
              ? GestureDetector(
                  child: Icon(Icons.cancel,
                      size: Style.fieldClearIconSize,
                      color: Style.fieldClearIconColor),
                  onTap: () {
                    widget.controller.text = '';
                    if (widget.onChange != null) widget.onChange("");
                  },
                )
              : Container(),
          (widget.rightIcon != null || widget.right != null)
              ? SizedBox(width: Style.intervalMd)
              : Container(),
          (widget.rightIcon != null && widget.right == null)
              ? GestureDetector(
                  child: Icon(widget.rightIcon,
                      size: Style.fieldIconSize,
                      color: Style.fieldRightIconColor),
                  onTap: () => widget.clickRight(),
                )
              : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Style.fieldPadding,
      color: Style.fieldInputBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          (widget.leftIcon != null || widget.label != null)
              ? buildLeft()
              : Container(),
          SizedBox(width: widget.label != null ? Style.intervalLg : 0),
          buildTextField(),
          buildRight(),
          widget.right != null ? widget.right : Container(),
        ],
      ),
    );
  }
}
