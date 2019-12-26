import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kit/theme/style.dart';

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
  final Function(String val) onChange;

  Rate({
    Key key,
    this.count: 5,
    @required this.value,
    this.size: Style.rateIconSize,
    this.gutter: Style.rateHorizontalGutter,
    this.icon: Icons.star,
    this.voidIcon: Icons.star_border,
    this.color: Style.rateActiveColor,
    this.voidColor: Style.rateInactiveColor,
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
      child: Wrap(
        children: _buildChildren(),
        spacing: widget.gutter,
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    for (int i = 1; i <= widget.count; i++) {
      Widget item = Container(
        child: GestureDetector(
          child: Icon(
            _starNum >= i ? widget.icon : widget.voidIcon,
            color: _starNum >= i
              ? widget.disabled ? Style.rateDisabledColor : widget.color
              : widget.voidColor,
            size: widget.size,
          ),
          onTap: widget.readonly || widget.disabled
            ? null
            : () {
              setState(() {
                _starNum = i;
              });
              if (widget.onChange != null) widget.onChange(_starNum.toString());
            }
        ),
      );
      widgets.add(item);
    }
    return widgets;
  }
}
