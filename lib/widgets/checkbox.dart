import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';

class NCheckbox extends StatefulWidget {
  final String name;
  bool value;
  final String shape;
  final String text;
  final bool disabled;
  final bool readonly;
  final double iconSize;
  final Color checkedColor;
  final Function(bool value) onChange;

  NCheckbox(
      {Key key,
      this.name,
      this.value: false,
      this.shape: 'round',
      this.text,
      this.disabled: false,
      this.readonly: false,
      this.iconSize: Style.checkboxSize,
      this.checkedColor: Style.checkboxCheckedIconColor,
      this.onChange})
      : assert(["round", "square"].indexOf(shape) > -1,
            "shape must be round, or square"),
        super(key: key);

  @override
  _NCheckbox createState() => _NCheckbox();
}

class _NCheckbox extends State<NCheckbox> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.disabled
        ? Style.checkboxDisabledBackgroundColor
        : widget.value ? widget.checkedColor : Style.checkboxBackgroundColor;
    Color borderColor = widget.disabled || !widget.value
        ? Style.checkboxBorderColor
        : widget.checkedColor;
    Color iconColor = widget.disabled
        ? (widget.value
            ? Style.checkboxDisabledIconColor
            : Style.checkboxDisabledBackgroundColor)
        : Style.checkboxBackgroundColor;
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
                  borderRadius: BorderRadius.circular(
                      widget.shape == 'square' ? 0 : Style.borderRadiusMax),
                  border: Border.all(
                      width: Style.borderWidthBase, color: borderColor),
                  color: backgroundColor),
              child: Icon(Icons.check,
                  size: widget.iconSize / 1.25, color: iconColor),
            ),
            widget.text != null
                ? SizedBox(width: Style.checkboxLabelMargin)
                : Container(),
            widget.text != null
                ? Text("${widget.text}",
                    style: TextStyle(
                        color: widget.disabled
                            ? Style.checkboxDisabledLabelColor
                            : Style.checkboxLabelColor))
                : Container()
          ],
        ),
      ),
    );
  }
}
