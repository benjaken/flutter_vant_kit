import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef int CallBack(int);

//星级评分
class Rate extends StatefulWidget {
  // 图标总数
  final int count;
  // 当前分值
  final int value;
  // 图标大小
  final double size;
  // 图标间距
  final double gutter;
  // 自定义图标
  final IconData icon;
  // 自定义未选中图标
  final IconData voidIcon;
  // 选中颜色
  final Color color;
  // 未选中颜色
  final Color voidColor;
  // 是否为只读状态
  final bool readonly;
  // 是否为禁用状态
  final bool disabled;
  // 当前分值变化时触发的事件
  final CallBack onChange;

  Rate({
    Key key,
    this.count: 5,
    @required this.value,
    this.size: 24.0,
    this.gutter: 4.0,
    this.icon: Icons.star,
    this.voidIcon: Icons.star_border,
    this.color: Colors.orange,
    this.voidColor: Colors.grey,
    this.readonly: false,
    this.disabled: false,
    this.onChange,
  }) : assert(count > 1 && value >= 1,
    'count 或 value 不能小于1'),
    super(key: key);

  @override
  _Rate createState() => _Rate();
}

class _Rate extends State<Rate> {
  int _starNum;

  @override
  void initState() {
    super.initState();
    _starNum = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    ThemeData theme = Theme.of(context);

    List<Widget> widgets = [];
    for (int i = 1; i <= widget.count; i++) {
      Widget item = Container(
        margin: EdgeInsets.only(right: widget.gutter),
        child: GestureDetector(
          child: Icon(
            _starNum >= i ? widget.icon : widget.voidIcon,
            color: _starNum >= i
              ? widget.disabled ? Colors.grey : widget.color
              : widget.voidColor.withOpacity(0.4),
            size: widget.size,
          ),
          onTap: widget.readonly || widget.disabled
            ? null
            : () {
              setState(() {
                _starNum = i;
              });
              if (widget.onChange != null) widget.onChange(_starNum);
            }
        ),
      );
      widgets.add(item);
    }
    return widgets;
  }
}
