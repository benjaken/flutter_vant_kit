import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/numberKeyboard.dart';

class PasswordInput extends StatefulWidget {
  // 密码值
  final String value;
  // 密码最大长度
  final int length;
  // 是否隐藏密码内容
  final bool mask;
  // 当密码值位数等于最大程度，是否自动隐藏键盘
  final bool hideWhenSubmitted;
  // 输入框下方文字提示
  final String info;
  // 输入框点击时触发
  final Function() onClick;
  // 密码值改变时触发
  final Function(String val) onChange;
  // 密码值位数等于最大程度时触发
  final Function(String val) onSubmitted;

  PasswordInput(
      {Key key,
      this.value: "",
      this.length: 6,
      this.mask: true,
      this.hideWhenSubmitted: false,
      this.info,
      this.onClick,
      this.onChange,
      this.onSubmitted})
      : super(key: key);

  @override
  _PasswordInput createState() => _PasswordInput();
}

class _PasswordInput extends State<PasswordInput> {
  String _value;
  List<String> _codeList;

  @override
  void initState() {
    _value = widget.value;
    _codeList = new List()..length = widget.length;
    List<String> origin = widget.value.split('');
    _codeList.setAll(0, origin);
    super.initState();
  }

  Widget _buildInputWidget(int p) {
    return Expanded(
      child: Container(
          height: Style.passwordInputHeight,
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            left: widget.length < 6 && p > 0 ? Style.passwordInputGutter : 0,
            right: widget.length < 6 && p < widget.length - 1
                ? Style.passwordInputGutter
                : 0,
          ),
          decoration: BoxDecoration(
              borderRadius: widget.length < 6
                  ? BorderRadius.circular(Style.passwordInputBorderRadius)
                  : p == 0
                      ? BorderRadius.horizontal(
                          left:
                              Radius.circular(Style.passwordInputBorderRadius))
                      : p == widget.length - 1
                          ? BorderRadius.horizontal(
                              right: Radius.circular(
                                  Style.passwordInputBorderRadius))
                          : null,
              border: (p == 0 || p == widget.length - 1)
                  ? Border.all(color: Style.borderColor)
                  : Border(
                      top: BorderSide(
                          color: Style.borderColor,
                          width: Style.borderWidthBase),
                      left: BorderSide(
                          color: Style.borderColor,
                          width: widget.length < 6 ? Style.borderWidthBase : 0),
                      right: BorderSide(
                          color: Style.borderColor,
                          width: p < widget.length - 2 || widget.length < 6
                              ? Style.borderWidthBase
                              : 0),
                      bottom: BorderSide(
                          color: Style.borderColor,
                          width: Style.borderWidthBase),
                    ),
              color: Style.passwordInputBackgroundColor),
          child: Text(
              _codeList.elementAt(p) == null
                  ? ""
                  : widget.mask ? "●" : _codeList[p],
              style: TextStyle(
                  fontSize: Style.passwordInputFontSize,
                  color: Style.passwordInputColor))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(
                bottom: widget.info != null ? Style.paddingSm : 0),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(Style.passwordInputBorderRadius),
            ),
            child: Row(
                children:
                    List.generate(widget.length, (i) => _buildInputWidget(i))),
          ),
          onTap: () {
            NumberKeyboard(
                value: _value,
                maxlength: widget.length,
                onChange: (val) {
                  List<String> newval = val.split('');
                  setState(() {
                    _codeList = new List()..length = widget.length;
                    _codeList.setAll(0, newval);
                    _value = val;
                  });
                  if (widget.onChange != null) widget.onChange(val);
                  if (widget.onSubmitted != null &&
                      newval.length == widget.length) {
                    if (widget.hideWhenSubmitted) Navigator.pop(context);
                    widget.onSubmitted(val);
                  }
                }).show(context);
            if (widget.onClick != null) widget.onClick();
          },
        ),
        widget.info != null
            ? Text(widget.info,
                style: TextStyle(
                    fontSize: Style.passwordInputInfoFontSize,
                    color: Style.passwordInputInfoColor))
            : Container()
      ],
    );
  }
}
