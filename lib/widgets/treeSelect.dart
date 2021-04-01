import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/sidebar.dart';

class TreeSelect extends StatefulWidget {
  // 所有选项
  final List<SideBarItem> list;
  // 左侧选中项的索引
  final int mainActiveIndex;
  // 右侧选中项的 id
  final List<int>? activeId;
  // 高度
  final double height;
  // 右侧项最大选中个数
  final int max;
  // 左侧选中值改变时触发
  final Function(List<int?>? list)? onChange;

  TreeSelect(
      {Key? key,
      required this.list,
      this.mainActiveIndex: 0,
      this.activeId,
      this.height: 300,
      this.max: 1,
      this.onChange})
      : super(key: key);

  @override
  _TreeSelect createState() => _TreeSelect();
}

class _TreeSelect extends State<TreeSelect> {
  int? _mainActiveIndex;
  List<int?>? _activeId;

  @override
  void initState() {
    _mainActiveIndex = widget.mainActiveIndex;
    _activeId = widget.activeId ?? [];
    super.initState();
  }

  List<Widget> buildItem() {
    List<Widget> widgets = [];
    List areaList = widget.list[_mainActiveIndex!].children ?? [];
    for (int i = 0; i < areaList.length; i++) {
      TreeItem item = areaList[i];
      widgets.add(GestureDetector(
        child: Container(
          padding: Style.treeSelectContentPadding,
          color: Style.treeSelectContentBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("${item.text}",
                  style: TextStyle(
                      fontSize: Style.treeSelectFontSize,
                      fontWeight: _activeId!.contains(item.id)
                          ? Style.treeSelectItemFontWeight
                          : null,
                      color: item.disabled
                          ? Style.treeSelectItemDisabledColor
                          : _activeId!.contains(item.id)
                              ? Style.treeSelectItemActiveColor
                              : Style.treeSelectItemColor)),
              Icon(Icons.check_circle,
                  size: Style.treeSelectFontSize,
                  color: _activeId!.contains(item.id)
                      ? Style.treeSelectItemActiveColor
                      : Style.treeSelectContentBackgroundColor)
            ],
          ),
        ),
        onTap: () {
          if (item.disabled) return;
          setState(() {
            if (_activeId!.contains(item.id)) {
              _activeId!.remove(item.id);
            } else {
              if (_activeId!.length == widget.max && widget.max > 1) return;
              if (_activeId!.length > 0 && widget.max == 1) {
                _activeId!.removeLast();
              }
              _activeId!.add(item.id);
            }
            if (widget.onChange != null) widget.onChange!(_activeId);
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
              active: _mainActiveIndex,
              list: widget.list,
              onChange: (val) {
                setState(() {
                  _mainActiveIndex = val;
                });
              },
            ),
            height: widget.height,
            color: Style.treeSelectNavBackgroundColor),
        Expanded(
          child: Container(
            height: widget.height,
            color: Style.treeSelectContentBackgroundColor,
            child: widget.list[_mainActiveIndex!].content != null
                ? widget.list[_mainActiveIndex!].content
                : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[...buildItem()],
                  )
                ),
          ),
        )
      ],
    );
  }
}

class TreeItem {
  final String text;
  final int? id;
  final bool disabled;

  TreeItem({required this.text, this.id, this.disabled: false});
}
