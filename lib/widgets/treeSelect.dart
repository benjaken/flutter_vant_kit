import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/sidebar.dart';

typedef ValueCallBack(List<int> list);

class TreeSelect extends StatefulWidget {
  // 所有选项
  List<SideBarItem> list;
  // 左侧选中项的索引
  int mainActiveIndex;
  // 右侧选中项的 id
  List<int> activeId;
  // 高度
  final double height;
  // 右侧项最大选中个数	
  final int max;
  // 左侧选中值改变时触发
  final ValueCallBack onChange;

  TreeSelect({
    Key key,
    @required this.list,
    this.mainActiveIndex: 0,
    this.activeId,
    this.height: 300,
    this.max: 1,
    this.onChange
  }) : super(key: key);

  @override
  _TreeSelect createState() => _TreeSelect();
}

class _TreeSelect extends State<TreeSelect> {  
  @override
  void initState () {
    widget.activeId = widget.activeId??[];
    super.initState();
  }

  List<Widget> buildItem () {
    List<Widget> widgets = [];
    List areaList = widget.list[widget.mainActiveIndex].children;
    for(int i = 0; i < areaList.length; i++) {
      TreeItem item = areaList[i];
      widgets.add(GestureDetector(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("${item.text}", style: TextStyle(
                fontWeight: widget.activeId.contains(item.id) ? FontWeight.bold : FontWeight.normal,
                color: item.disabled ? Colors.grey : widget.activeId.contains(item.id) ? Colors.red : Colors.black
              )),
              Icon(Icons.check_circle, size: 16, color: widget.activeId.contains(item.id) ? Colors.red : Colors.white)
            ],
          ),
        ),
        onTap: () {
          if (item.disabled) return;
          setState(() {
            if (widget.activeId.contains(item.id)) {
              widget.activeId.remove(item.id);
            } else {
              if (widget.activeId.length == widget.max && widget.max > 1) return;
              if (widget.activeId.length > 0 && widget.max == 1) {
                widget.activeId.removeLast();
              }
              widget.activeId.add(item.id);
            }
            if (widget.onChange != null) widget.onChange(widget.activeId);
          });
        },
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Sidebar(
            active: widget.mainActiveIndex,
            list: widget.list,
            onChange: (val) {
              setState(() {
                widget.mainActiveIndex = val;
              });
            },
          ),
          height: widget.height,
          color: Color(0xffebedf0),
        ),
        Expanded(
          child: Container(
            height: widget.height,
            color: Colors.white,
            child: widget.list[widget.mainActiveIndex].content != null ? widget.list[widget.mainActiveIndex].content : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...buildItem()
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TreeItem {
  final String text;
  final int id;
  final bool disabled;

  TreeItem({
    @required this.text,
    this.id,
    this.disabled: false
  });
}