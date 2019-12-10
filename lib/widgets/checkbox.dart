import 'package:flutter/material.dart';

typedef ValueCallBack(bool value);

class NCheckbox extends StatefulWidget {
  final String name;
  bool value;
  final String shape;
  final String text;
  final bool disabled;
  final bool readonly;
  final double iconSize;
  final Color checkedColor;
  final ValueCallBack onChange;

  NCheckbox({
    Key key,
    this.name,
    this.value: false,
    this.shape: 'round',
    this.text,
    this.disabled: false,
    this.readonly: false,
    this.iconSize: 20,
    this.checkedColor: Colors.blueAccent,
    this.onChange
  }) : super(key: key);
  
  @override
  _NCheckbox createState() => _NCheckbox();
}

class _NCheckbox extends State<NCheckbox>{
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.disabled ? Color(0xffebedf0) : widget.value ? widget.checkedColor : Colors.white;
    Color borderColor = widget.disabled || !widget.value ? Color(0xffc8c9cc) : widget.checkedColor;
    Color iconColor = widget.disabled ? (widget.value ? Color(0xffc8c9cc) : Color(0xffebedf0)) : Colors.white;
    return GestureDetector(
      onTap: () {
        if (widget.disabled || widget.readonly) return;
        setState(() {
          widget.value = !widget.value;
          if (widget.onChange != null) widget.onChange(widget.value);
        });
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              width: widget.iconSize,
              height: widget.iconSize,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.shape == 'square' ? 0 : widget.iconSize / 2),
                border: Border.all(width: 1, color: borderColor),
                color: backgroundColor
              ),
              child: Icon(Icons.check, size: widget.iconSize - 4, color: iconColor),
            ),
            widget.text != null ? SizedBox(width: 6) : Container(),
            widget.text != null ? Text("${widget.text}", style: TextStyle()) : Container()
          ],
        ),
      ),
    );
  }
}