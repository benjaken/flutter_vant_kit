import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Steppers extends StatefulWidget {
  // 当前值
  final double value;
  // 最小值
  final double min;
  // 最大值
  final double max;
  // 步长，每次点击时改变的值
  final double step;
  // 是否禁用步进器
  final bool disabled;
  // 是否禁用输入框
  final bool disabledInput;
  // 自定义大小
  final double size;
  // 自定义 input 宽度
  final double inputWidth;
  // 是否显示增加按钮
  final bool showPlus;
  // 是否显示减少按钮
  final bool showMinus;
  // 固定显示的小数位数
  final int decimalLength;
  // 当前值变化时触发的事件
  final Function(String val) onChange;

  Steppers(
      {Key key,
      this.value: 1,
      this.onChange,
      this.min: 0,
      this.max: 9999999,
      this.step: 1,
      this.size: Style.stepperButtonIconSize,
      this.disabled: false,
      this.disabledInput: false,
      this.showPlus: true,
      this.showMinus: true,
      this.decimalLength: 0,
      this.inputWidth})
      : super(key: key);

  @override
  _Stepper createState() => _Stepper();
}

class _Stepper extends State<Steppers> {
  double value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  Widget buildMinusButton() {
    bool minusBtnDisabled = value <= widget.min ||
        value - widget.step < widget.min ||
        widget.onChange == null ||
        widget.disabled;
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(Style.stepperBorderRadius),
          ),
          color: minusBtnDisabled
              ? Style.stepperButtonDisabledColor
              : Style.stepperBackgroundColor),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(Style.stepperBorderRadius),
          ),
          child: Container(
            width: Style.stepperButtonWidth,
            height: Style.stepperHeight,
            child: Icon(Icons.remove,
                size: widget.size,
                color: minusBtnDisabled
                    ? Style.stepperDisabledIconColor
                    : Style.stepperButtonIconColor),
          ),
          onTap: minusBtnDisabled
              ? null
              : () {
                  double newVal = value - widget.step;
                  String val = newVal.toStringAsFixed(widget.decimalLength);
                  setState(() {
                    value = newVal;
                  });
                  widget.onChange(val);
                },
        ),
      ),
    );
  }

  Widget buildPlusButton() {
    bool addBtnDisabled = value >= widget.max ||
        value + widget.step > widget.max ||
        widget.onChange == null ||
        widget.disabled;
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(Style.stepperBorderRadius),
          ),
          color: addBtnDisabled
              ? Style.stepperButtonDisabledColor
              : Style.stepperBackgroundColor
          // border: Border.all(color: Style.borderColor),
          ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(Style.stepperBorderRadius),
          ),
          child: Container(
            width: Style.stepperButtonWidth,
            height: Style.stepperHeight,
            child: Icon(Icons.add,
                size: widget.size,
                color: addBtnDisabled
                    ? Style.stepperDisabledIconColor
                    : Style.stepperButtonIconColor),
          ),
          onTap: addBtnDisabled
              ? null
              : () {
                  double newVal = value + widget.step;
                  String val = newVal.toStringAsFixed(widget.decimalLength);
                  setState(() {
                    value = newVal;
                  });
                  widget.onChange(val);
                },
        ),
      ),
    );
  }

  Widget buildInput() {
    final TextEditingController controller = TextEditingController(
        text: value.toStringAsFixed(widget.decimalLength));
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Style.paddingBase),
      color: widget.disabled
          ? Style.stepperInputDisabledBackgroundColor
          : Style.stepperBackgroundColor,
      width: widget.inputWidth != null
          ? widget.inputWidth
          : Style.stepperInputWidth,
      height: Style.stepperHeight,
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          controller: controller,
          enabled: !widget.disabled,
          keyboardType: TextInputType.numberWithOptions(
              decimal: widget.decimalLength > 0),
          inputFormatters: [
            WhitelistingTextInputFormatter(
                RegExp("[0-9${widget.decimalLength > 0 ? '.' : ''}]"))
          ],
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(0),
            border: InputBorder.none,
          ),
          style: TextStyle(
              fontSize: Style.stepperInputFontSize,
              color: widget.disabled
                  ? Style.stepperInputDisabledTextColor
                  : Style.stepperInputTextColor),
          cursorWidth: 1,
          cursorColor: Style.textColor,
          readOnly: widget.disabledInput,
          onSubmitted: (val) {
            double number = double.parse(val);
            if (number > widget.max) number = widget.max;
            if (number < widget.min) number = widget.min;
            String newVal = number.toStringAsFixed(widget.decimalLength);
            setState(() {
              value = number;
            });
            widget.onChange(newVal);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        widget.showMinus ? buildMinusButton() : Container(),
        buildInput(),
        widget.showPlus ? buildPlusButton() : Container(),
      ],
    );
  }
}
