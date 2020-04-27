import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/badge.dart';

class Sidebar extends StatefulWidget {
  // 当前选项
  final int active;
  // 所有选项
  final List<SideBarItem> list;
  // 当前值改变时触发
  final Function(int val) onChange;

  Sidebar({Key key, this.active: 0, @required this.list, this.onChange})
      : super(key: key);

  @override
  _Sidebar createState() => _Sidebar();
}

class _Sidebar extends State<Sidebar> {
  int _active;

  @override
  void initState() {
    super.initState();
    _active = widget.active;
  }

  List<Widget> buildItem() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.list.length; i++) {
      SideBarItem item = widget.list[i];
      Widget text = Text("${item.title}",
          style: TextStyle(
              fontWeight: _active == i ? Style.sidebarSelectedFontWeight : null,
              color: item.disabled
                  ? Style.sidebarDisabledTextColor
                  : Style.sidebarTextColor));
      widgets.add(GestureDetector(
        child: Container(
          padding: Style.sidebarPadding,
          decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    width: Style.sidebarSelectedBorderWidth,
                    color: _active == i
                        ? Style.sidebarSelectedBorderColor
                        : Style.sidebarBackgroundColor)),
            color: _active == i
                ? Style.sidebarSelectedBackgroundColor
                : Style.sidebarBackgroundColor,
          ),
          //TODO:解决badge的value改变时会重新渲染
          child: (item.dot || item.info != null)
              ? Badge(
                  value: item.info,
                  child: text,
                )
              : text,
        ),
        onTap: () {
          if (item.disabled) return;
          setState(() {
            _active = i;
            if (widget.onChange != null) widget.onChange(i);
          });
          if (item.onClick != null) item.onClick(i);
        },
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[...buildItem()],
      )
    );
  }
}

class SideBarItem {
  String title;
  bool dot;
  String info;
  bool disabled;
  Function(int val) onClick;
  List children;
  Widget content;

  SideBarItem(
      {this.title,
      this.dot: false,
      this.info,
      this.disabled: false,
      this.onClick,
      this.children,
      this.content});
}
