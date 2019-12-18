import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/collapseItem.dart';

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

  Collapse({
    Key key,
    this.name,
    @required this.list,
    this.accordion: false,
    this.border: true,
    this.onChange
  }) : super(key: key);

  @override
  _Collapse createState() => _Collapse();
}

class _Collapse extends State<Collapse> {
  List<Widget> buildItems () {
    List<Widget> widgets = [];
    for(int i = 0; i < widget.list.length; i++) {
      CollapseItem item = widget.list[i];
      String name = item.name??i.toString();
      widgets.add(
        CollapseItem(
          name: name,
          title: item.title,
          customTitle: item.customTitle,
          icon: item.icon,
          value: item.value,
          label: item.label,
          customLabel: item.customLabel,
          clickable: item.clickable,
          isExpanded: widget.name.contains(name),
          children: item.children,
          rightIcon: item.rightIcon,
          onExpansionChanged: (val) {
            setState(() {
              if (widget.accordion) widget.name = [];
              val ? widget.name.add(name) : widget.name.remove(name);
            });
            if (widget.onChange != null) widget.onChange(widget.name);
          },
        )
      );
      if (i < widget.list.length - 1) widgets.add(Container(
        height: 1,
        color: Color(0xffebedf0),
      ));
    }
    return widgets;
  }
  
  @override
  Widget build (BuildContext context) {
    widget.name = widget.name??[];
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: widget.border ? 1 : 0, color: Color(0xffebedf0)),
          bottom: BorderSide(width: widget.border ? 1 : 0, color: Color(0xffebedf0)),
        )
      ),
      child: Column(
        children: buildItems(),
      ),
    );
  }
}