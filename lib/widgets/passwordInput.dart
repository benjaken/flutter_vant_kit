import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/numberKeyboard.dart';

typedef CallBack();
typedef ValueCallBack(String val);

class PasswordInput extends StatefulWidget {
  // 密码值	
  String value;
  // 密码最大长度	
  final int length;
  // 是否隐藏密码内容	
  final bool mask;
  // 当密码值位数等于最大程度，是否自动隐藏键盘
  final bool hideWhenSubmitted;
  // 输入框下方文字提示	
  final String info;
  // 输入框点击时触发
  final CallBack onClick;
  // 密码值改变时触发
  final ValueCallBack onChange;
  // 密码值位数等于最大程度时触发
  final ValueCallBack onSubmitted;

  PasswordInput({
    Key key,
    this.value: "",
    this.length: 6,
    this.mask: true,
    this.hideWhenSubmitted: false,
    this.info,
    this.onClick,
    this.onChange,
    this.onSubmitted
  }) : super(key: key);

  @override
  _PasswordInput createState() => _PasswordInput();
}

class _PasswordInput extends State<PasswordInput> {
  List<String> _codeList;

  @override
  void initState() {
    _codeList = new List()..length = widget.length;
    List<String> origin = widget.value.split('');
    _codeList.setAll(0, origin);
    super.initState();
  }

  Widget _buildInputWidget(int p){
    return Expanded(
      child: Container(
        height: 52,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: widget.length < 6 && p > 0 ? 5: 0,
          right: widget.length < 6 && p < widget.length - 1 ? 5: 0,
        ),
        decoration: BoxDecoration(
          borderRadius: widget.length < 6 ? BorderRadius.circular(4.0)
          : p == 0 ? BorderRadius.horizontal(left: Radius.circular(4.0))
          : p == widget.length - 1 ? BorderRadius.horizontal(right: Radius.circular(4.0)) 
          : null,
          border: (p == 0 || p == widget.length - 1) ? Border.all(color: Color(0xffebedf0))
          : Border(
            top: BorderSide(color: Color(0xffebedf0), width: 1),
            left: BorderSide(color: Color(0xffebedf0), width: widget.length < 6 ? 1 : 0),
            right: BorderSide(color: Color(0xffebedf0), width: p < widget.length - 2 || widget.length < 6 ? 1 : 0),
            bottom: BorderSide(color: Color(0xffebedf0), width: 1),
          ),
          color: Colors.white
        ),
        child: Text(_codeList.elementAt(p) == null ? "" : widget.mask ? "●" : _codeList[p], style: TextStyle(fontSize: 18))
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(bottom: widget.info != null ? 10 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              children: List.generate(widget.length, (i) => _buildInputWidget(i))
            ),
          ),
          onTap: () {
            NumberKeyboard(
              value: widget.value,
              maxlength: widget.length,
              onChange: (val) {
                List<String> newval = val.split('');
                setState(() {
                  _codeList = new List()..length = widget.length;
                  _codeList.setAll(0, newval);
                  widget.value = val;
                });
                if (widget.onChange != null) widget.onChange(val);
                if (widget.onSubmitted != null && newval.length == widget.length) {
                  if (widget.hideWhenSubmitted) Navigator.pop(context);
                  widget.onSubmitted(val);
                }
              }
            ).show(context);
            if (widget.onClick != null) widget.onClick();
          },
        ),
        widget.info != null ? Text(widget.info, style: TextStyle(fontSize: 14, color: Colors.grey)) : Container()
      ],
    );
  }
}