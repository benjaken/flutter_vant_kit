import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';
import 'package:flutter_kit/widgets/checkbox.dart';
import 'package:flutter_kit/widgets/cell.dart';
import 'package:flutter_kit/widgets/cellGroup.dart';

typedef ListCallBack(List<String> value);

class CheckboxGroup extends StatefulWidget {
  // 所有选项
  final List<CheckItem> list;
  // 所有选中项的标识符
  List<String> value;
  // 形状
  final String shape;
  // 最大可选数
  final int max;
  // 是否为单元格组件
  final bool inCellGroup;
  // 是否禁用复选框
  final bool disabled;
  // 所有复选框的图标大小
  final double iconSize;
  // 所有复选框的选中状态颜色
  final Color checkedColor;
  // 当绑定值变化时触发的事件
  final ListCallBack onChange;

  CheckboxGroup(
      {Key key,
      this.value,
      this.shape,
      this.list,
      this.max: 9999,
      this.onChange,
      this.inCellGroup: false,
      this.disabled,
      this.checkedColor,
      this.iconSize})
      : super(key: key);

  @override
  _CheckboxGroup createState() => _CheckboxGroup();
}

class _CheckboxGroup extends State<CheckboxGroup> {
  List<Widget> buildItems() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.list.length; i++) {
      CheckItem item = widget.list[i];
      Widget checkbox = NCheckbox(
        value: widget.value.contains(item.name),
        shape: widget.shape ?? item.shape,
        text: widget.inCellGroup ? '' : item.text,
        disabled: widget.disabled ?? item.disabled,
        readonly: !widget.value.contains(item.name) &&
            widget.value.length == widget.max,
        iconSize: widget.iconSize ?? item.iconSize,
        checkedColor: widget.checkedColor ?? item.checkedColor,
        onChange: (val) {
          if (val && widget.value.length < widget.max) {
            setState(() {
              widget.value.add(item.name);
            });
          } else {
            setState(() {
              widget.value.remove(item.name);
            });
          }
          if (widget.onChange != null) widget.onChange(widget.value);
        },
      );
      widgets.add(widget.inCellGroup
          ? Cell(
              title: item.text,
              customRight: checkbox,
            )
          : checkbox);
      if (i < widget.list.length - 1 && !widget.inCellGroup) {
        widgets.add(SizedBox(height: Style.intervalLg));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return widget.inCellGroup
        ? CellGroup(
            children: <Widget>[...buildItems()],
          )
        : Column(
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

  CheckItem(
      {this.name,
      this.value,
      this.shape,
      this.text,
      this.disabled,
      this.iconSize,
      this.checkedColor});
}
