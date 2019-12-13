import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef CallBack(String val);

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
  final CallBack onChange;

  Steppers({
    Key key,
    this.value: 1,
    this.onChange,
    this.min: 0,
    this.max: 9999999,
    this.step: 1,
    this.size: 20.0,
    this.disabled: false,
    this.disabledInput: false,
    this.showPlus: true,
    this.showMinus: true,
    this.decimalLength: 0,
    this.inputWidth
  }): super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final iconPadding = const EdgeInsets.all(4.0);
    final TextEditingController controller = TextEditingController(text: value.toStringAsFixed(widget.decimalLength));
    bool minusBtnDisabled = value <= widget.min ||
        value - widget.step < widget.min ||
        widget.onChange == null || widget.disabled;
    bool addBtnDisabled = value >= widget.max ||
        value + widget.step > widget.max ||
        widget.onChange == null || widget.disabled;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        widget.showMinus ? InkWell(
          child: Container(
            padding: iconPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(4.0),
              ),
              border: Border.all(color: Color(0xffebedf0)),
            ),
            child: Icon(
              Icons.remove,
              size: widget.size,
              color: minusBtnDisabled ? Colors.grey : Colors.blueAccent
            ),
          ),
          onTap: minusBtnDisabled ? null : () {
            double newVal = value - widget.step;
            String val = newVal.toStringAsFixed(widget.decimalLength);
            setState(() {
              value = newVal;
            });
            widget.onChange(val);
          },
        ) : Container(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: Color(0xffebedf0)),
              bottom: BorderSide(width: 1.0, color: Color(0xffebedf0)),
              left: BorderSide(width: widget.showMinus ? 0.0 : 1.0, color: Color(0xffebedf0)),
              right: BorderSide(width: widget.showPlus ? 0.0 : 1.0, color: Color(0xffebedf0)),
            )
          ),
          width: widget.inputWidth != null ? widget.inputWidth : widget.size + 8.0,
          height: widget.size + 10.0,
          child: Center(
            child: TextField(
              textAlign: TextAlign.center,
              controller: controller,
              enabled: !widget.disabled,
              keyboardType: TextInputType.numberWithOptions(decimal: widget.decimalLength > 0),
              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9${widget.decimalLength > 0 ? '.' : ''}]"))],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
              ),
              cursorWidth: 1,
              cursorColor: Colors.black,
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
        ),
         widget.showPlus ? InkWell(
          child: Container(
            padding: iconPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(4.0),
              ),
              border: Border.all(color: Color(0xffebedf0)),
            ),
            child: Icon(
              Icons.add,
              size: widget.size,
              color: addBtnDisabled ? Colors.grey : Colors.blueAccent
            ),
          ),
          onTap: addBtnDisabled ? null : () {
            double newVal = value + widget.step;
            String val = newVal.toStringAsFixed(widget.decimalLength);
            setState(() {
              value = newVal;
            });
            widget.onChange(val);
          },
        ) : Container(),
      ],
    );
  }
}
