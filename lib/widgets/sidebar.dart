import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/badge.dart';

typedef ValueCallBack(int val);

class Sidebar extends StatefulWidget {
  int active;
  final List<SideBarItem> list;
  final ValueCallBack onChange;

  Sidebar({
    Key key,
    this.active: 0,
    @required this.list,
    this.onChange
  }) : super(key: key);

  @override
  _Sidebar createState () => _Sidebar();
}

class _Sidebar extends State<Sidebar> {
  List<Widget> buildItem () {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.list.length; i++) {
      SideBarItem item = widget.list[i];
      Widget text = Text("${item.title}", style: TextStyle(
        fontWeight: widget.active == i ? FontWeight.bold : FontWeight.normal,
        color: item.disabled ? Colors.grey : Colors.black
      ));
      widgets.add(
        GestureDetector(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 15, 50, 15),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 3, color: widget.active == i ? Colors.red : Color(0xffebedf0))
              ),
              color: widget.active == i ? Colors.white : Color(0xffebedf0),
            ),
            //TODO:解决badge的value改变时会重新渲染
            child: (item.dot || item.info != null) ? Badge(
              value: item.info,
              child: text,
            ) : text,
          ),
          onTap: () {
            if (item.disabled) return;
            setState(() {
              widget.active = i;
              if (widget.onChange != null) widget.onChange(i);
            });
            if (item.onClick != null) item.onClick(i);
          },
        )
      );
    }
    return widgets;
  }

  @override
  Widget build (BuildContext context) {
    return Column(
      children: <Widget>[
        ...buildItem()
      ],
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

  SideBarItem({
    this.title,
    this.dot: false,
    this.info,
    this.disabled: false,
    this.onClick,
    this.children,
    this.content
  });
}