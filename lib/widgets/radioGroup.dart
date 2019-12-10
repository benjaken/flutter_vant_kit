import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/checkbox.dart';
import 'package:flutter_kit/widgets/cell.dart';
import 'package:flutter_kit/widgets/cellGroup.dart';

typedef ValueCallBack(String value);

class RadioGroup extends StatefulWidget {
  // 选中项的标识符	
  String value;
  // 形状
  final String shape;
  // 所有选项
  final List<CheckItem> list;
  // 是否禁用所有单选框	
  final bool disabled;
  // 所有单选框的图标大小
  final double iconSize;
  // 所有单选框的选中状态颜色	
  final Color checkedColor;
  // 是否为单元格组件
  final bool inCellGroup;
  // 当绑定值变化时触发的事件	
  final ValueCallBack onChange;

  RadioGroup({
    Key key,
    this.shape,
    this.value,
    this.list,
    this.disabled,
    this.checkedColor,
    this.inCellGroup: false,
    this.onChange,
    this.iconSize
  }) : super(key: key);

  @override
  _RadioGroup createState() => _RadioGroup();
}

class _RadioGroup extends State<RadioGroup>{

  List<Widget> buildItems() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.list.length; i++) {
      CheckItem item = widget.list[i];
      Widget checkbox = NCheckbox(
        value: widget.value == item.name,
        shape: widget.shape??item.shape,
        text: widget.inCellGroup ? '' : item.text,
        disabled: widget.disabled??item.disabled,
        readonly: widget.value == item.name,
        iconSize: widget.iconSize??item.iconSize,
        checkedColor: widget.checkedColor??item.checkedColor,
        onChange: (val) {
          setState(() {
            widget.value = item.name;
          });
          if (widget.onChange != null) widget.onChange(widget.value); 
        },
      );
      widgets.add(widget.inCellGroup ? Cell(
        title: item.text,
        customRight: checkbox,
      ) : checkbox);
      if (i < widget.list.length - 1 && !widget.inCellGroup) {
        widgets.add(SizedBox(height: 12));
      }
    }
    return widgets;
  }

  Widget build(BuildContext context) {
    return widget.inCellGroup ? CellGroup(
      children: <Widget>[...buildItems()],
    ) : Column(
      children: <Widget>[...buildItems()],
    );
  }
}

class CheckItem {
  final String name;
  final bool value;
  final String shape;
  final String text;
  final bool disabled;
  final double iconSize;
  final Color checkedColor;

  CheckItem({
    this.name,
    this.value: false,
    this.shape: 'round',
    this.text,
    this.disabled: false,
    this.iconSize: 20,
    this.checkedColor: Colors.blueAccent
  });
}
