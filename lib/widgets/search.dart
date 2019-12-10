import 'package:flutter/material.dart';

typedef CallBack();
typedef SubmitCallBack(String val);

class Search extends StatefulWidget {
  // 搜索框形状
  final String shape;
  // 搜索框背景色	
  Color background;
  // 输入的最大字符数	
  final int maxLength;
  // 占位提示文字	
  final String placeholder;
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
  final Widget left; 
  final Widget right;
  final CallBack onClickLeft;
  final CallBack onClickRight;
  final SubmitCallBack onSubmitted;
  final CallBack onCancel;

  Search({
    Key key, 
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
    this.onSubmitted
  }) : super(key: key);

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.background = widget.background??Color(0xfff7f8fA);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.shape == 'round' ? 17.0 : 0),
                color: widget.background,
              ),
              child: Row(
                children: <Widget>[
                   widget.left != null ? widget.left : GestureDetector(
                     child: Icon(widget.leftIcon, size: 16, color: Colors.black),
                     onTap: () {
                       if (widget.onClickLeft != null) widget.onClickLeft();
                     },
                   ),
                  (widget.left != null || widget.leftIcon != null) ? SizedBox(width: 6) : Container(),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textInputAction: TextInputAction.search,
                      readOnly: widget.readonly,
                      enabled: !widget.disabled,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        hintText: widget.placeholder,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        counterText: "",
                        border: InputBorder.none,
                      ),
                      maxLength: widget.maxLength,
                      cursorColor: Colors.black,
                      cursorWidth: 1.0,
                      onSubmitted: (val) {
                        if (widget.onSubmitted != null) widget.onSubmitted(val);
                      }
                    ),
                  ),
                  widget.rightIcon != null ? Row(
                    children: <Widget>[
                      SizedBox(width: 6),
                      GestureDetector(
                        child: Icon(widget.rightIcon, size: 18, color: Colors.black),
                        onTap: () {
                          if (widget.onClickRight != null) widget.onClickRight();
                        },
                      )
                    ],
                  ) : Container()
                ],
              ),
            ),
          ),
          widget.showAction ? SizedBox(width: 8) : Container(),
          widget.showAction ? widget.right != null ? widget.right : GestureDetector(
            onTap: () {
              if (widget.onCancel != null) widget.onCancel();
            },
            child: Text(widget.actionText, style: TextStyle(fontSize: 16)),
          ) : Container()
        ],
      )
    );
  }
}