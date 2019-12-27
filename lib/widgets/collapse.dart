import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/collapseItem.dart';
import 'package:flutter_vant_kit/widgets/divider.dart';

class Collapse extends StatefulWidget {
  // 当前展开面板的 name
  List<String> name;
  // 子面板
  final List<CollapseItem> list;
  // 是否为手风琴
  final bool accordion;
  // 是否显示外边框
  final bool border;
  // 切换面板时触发
  final Function(List<String>) onChange;

  Collapse(
      {Key key,
      this.name,
      @required this.list,
      this.accordion: false,
      this.border: true,
      this.onChange})
      : super(key: key);

  @override
  _Collapse createState() => _Collapse();
}

class _Collapse extends State<Collapse> {
  List<Widget> buildItems() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.list.length; i++) {
      CollapseItem item = widget.list[i];
      String name = item.name ?? i.toString();
      widgets.add(CollapseItem(
        name: name,
        title: item.title,
        customTitle: item.customTitle,
        icon: item.icon,
        value: item.value,
        label: item.label,
        customLabel: item.customLabel,
        clickable: item.clickable,
        isExpanded: widget.name.contains(name),
        content: item.content,
        child: item.child,
        rightIcon: item.rightIcon,
        onExpansionChanged: (val) {
          setState(() {
            if (widget.accordion) widget.name = [];
            val ? widget.name.add(name) : widget.name.remove(name);
          });
          if (widget.onChange != null) widget.onChange(widget.name);
        },
      ));
      if (i < widget.list.length - 1) widgets.add(NDivider());
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    widget.name = widget.name ?? [];
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
              width: widget.border ? Style.borderWidthBase : 0,
              color: Style.borderColor),
          bottom: BorderSide(
              width: widget.border ? Style.borderWidthBase : 0,
              color: Style.borderColor),
        )),
        child: Column(
          children: buildItems(),
        ),
      ),
    );
  }
}
