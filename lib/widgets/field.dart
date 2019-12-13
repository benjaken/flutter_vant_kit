import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef int CallBack(int);

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
  final ValueChanged<String> onChange;
  // 输入框内容编辑结束时触发
  final VoidCallback onEditingComplete;
  // 输入框获得焦点时触发
  final VoidCallback onClick;
  // 内容提交(按回车)的回调
  final ValueChanged<String> onSubmitted;
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
    this.labelWidth: 90.0,
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
    _isShowDelete = !widget.controller.text.isEmpty;
    /// 监听输入改变  
    widget.controller.addListener((){
      if (mounted) {
        setState(() {
          _isShowDelete = !widget.controller.text.isEmpty;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          (widget.leftIcon != null || widget.label != null) ? Container(
            width: widget.labelWidth,
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: <Widget>[
                widget.require ? Text("*",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.redAccent,
                  )
                ) : Container(),
                widget.leftIcon != null ? GestureDetector(
                  child: Icon(widget.leftIcon, size: 18),
                  onTap: () => widget.clickLeft(),
                ) : Container(),
                widget.leftIcon != null ? SizedBox(width: 4) : Container(),
                widget.label != null ? Text("${widget.label}",
                  textAlign: widget.labelAlign,
                  style: TextStyle(
                    fontSize: 14
                  )
                ) : Container()
              ],
            ),
          ) : Container(),
          SizedBox(width: widget.label != null ? 12 : 0),
          Expanded(
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
              style: widget.style??TextStyle(color: widget.error ? Colors.red : Colors.black),
              inputFormatters: widget.inputFormatters,
              obscureText: widget.type == "password" ? !_isShowPwd : false,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: widget.error ? Colors.red : Colors.grey,
                  fontSize: 14,
                ),
                counterText: widget.type != "textarea" ? "" : null,
                border: InputBorder.none,              
                errorText: widget.errorMessage,
                errorStyle: TextStyle(fontSize: 12, height: 1, color: Colors.red),
                contentPadding: EdgeInsets.symmetric(vertical: 4)
              ),
              maxLength: widget.maxLength,
              toolbarOptions: widget.toolbarOptions,
              cursorColor: widget.error ? Colors.red : Colors.black,
              cursorWidth: 1.0,
              // validator: (val) {
              //   return val.length < 4 ? "密码长度错误" : null;
              // },
              onChanged: (val) {
                if (widget.onChange != null) widget.onChange(val);
              },
              onTap: () {
                if (widget.onClick != null) widget.onClick();
              },
              // onEditingComplete: () => widget.onEditingComplete,
              onFieldSubmitted: (val) {
                if (widget.onSubmitted != null) widget.onSubmitted(val);
              }
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: <Widget>[
                widget.type == "password" ? SizedBox(width: 8) : Container(),
                widget.type == "password" ? GestureDetector(
                  child: Icon(_isShowPwd ? Icons.visibility_off : Icons.visibility, size: 18, color: Colors.grey.withOpacity(.6)),
                  onTap: () {
                    setState(() {
                      _isShowPwd = !_isShowPwd;
                    });
                  },
                ) : Container(),
                widget.clearable && _isShowDelete ? SizedBox(width: 8) : Container(),
                widget.clearable && _isShowDelete ? GestureDetector(
                  child: Icon(Icons.cancel, size: 18, color: Colors.grey.withOpacity(.6)),
                  onTap: () {
                    widget.controller.text = '';
                    if (widget.onChange != null) widget.onChange("");
                  },
                ): Container(),
                (widget.rightIcon != null || widget.right != null) ? SizedBox(width: 8) : Container(),
                (widget.rightIcon != null && widget.right == null) ? GestureDetector(
                  child: Icon(widget.rightIcon, size: 18, color: Colors.blueAccent),
                  onTap: () => widget.clickRight(),
                ) : Container(),
              ],
            ),
          ),
          widget.right != null ? widget.right : Container(),
        ],
      ),
    );
  }
}