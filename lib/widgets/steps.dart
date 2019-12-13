import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/divider.dart';


class Steps extends StatefulWidget {
  // 所有步骤
  final List<StepItem> steps;
  // 当前步骤	
  final int active;
  // 显示方向，可选值为 vertical	
  final String direction;
  // 激活状态颜色	
  final Color activeColor;
  // 激活状态图标
  final IconData activeIcon;
  // 未激活状态图标
  final IconData inactiveIcon;

  Steps({
    Key key,
    @required this.steps,
    this.active: 0,
    this.direction: 'horizontal',
    this.activeColor: Colors.blueAccent,
    this.activeIcon: Icons.check_circle,
    this.inactiveIcon
  }) : assert(steps.length > 0, '步骤数量必须大于零');

  @override
  _Steps createState() => _Steps();
}

class _Steps extends State<Steps> {
  @override
  void initState () {
    super.initState();
  }

  buildHorizontal () {
    List<Widget> tops = [];
    List<Widget> bottoms = [];
    for (int i = 0; i < widget.steps.length; i++) {
      StepItem step = widget.steps[i];
      tops.add(Container(
        margin: EdgeInsets.only(bottom: 6),
        child: Text(step.title??"", style: TextStyle(color: i == widget.active ? widget.activeColor
          : i < widget.active ? Colors.black : Colors.grey)),
      ));
      bottoms.add(
        Container(
          alignment: AlignmentDirectional.centerStart,
          margin: i == 0 ? EdgeInsets.only(right: 8) : i == widget.steps.length - 1 ? EdgeInsets.only(left: 8) : EdgeInsets.symmetric(horizontal: 8),
          child: i == widget.active ? Icon(widget.activeIcon, color: widget.activeColor, size: 14,)
          : Icon(widget.inactiveIcon??Icons.lens, size: widget.inactiveIcon != null ? 14 : 8, color: i < widget.active ? widget.activeColor : Colors.grey),
        )
      );
      if (i < widget.steps.length - 1) bottoms.add(
        Expanded(
          child: NDivider(
            lineColor: i < widget.active ? widget.activeColor : Colors.grey,
          ),
        )
      );
    }
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tops,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: bottoms,
      )
    ];
  }

  buildVertical () {
    List<Widget> left = [];
    List<Widget> right = [];
    for (int i = 0; i < widget.steps.length; i++) {
      StepItem step = widget.steps[i];
      right.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(step.title??"", style: TextStyle(fontSize: 14, color: i == widget.active ? widget.activeColor
                    : i < widget.active ? Colors.black : Colors.grey)),
                  Text(step.date??"", style: TextStyle(fontSize: 14, color: i == widget.active ? widget.activeColor
                    : i < widget.active ? Colors.black : Colors.grey)),
                ],
              )
            ),
            (i < widget.steps.length - 1) ? NDivider() : Container()
          ],
        ),
      ));
      left.add(Container(
        width: 20,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 12,
              height: 12,
              alignment: AlignmentDirectional.center,
              margin: EdgeInsets.symmetric(vertical: 6),
              child: i == widget.active ? Icon(widget.activeIcon, color: widget.activeColor, size: 14,)
              : Icon(widget.inactiveIcon??Icons.lens, size: widget.inactiveIcon != null ? 14 : 8, color: i < widget.active ? widget.activeColor : Colors.grey),
            ),
            (i < widget.steps.length - 1) ? Container(
              width: 1,
              height: 34,
              color: i < widget.active ? widget.activeColor : Colors.grey,
            ) : Container()
          ],
        ),
      ));
    }
    return [
      Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(children: left),
      ),
      Expanded(child: Column(
        children: right,
      ),)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Color(0xffebedf0)),
          bottom: BorderSide(width: 1, color: Color(0xffebedf0)),
        ),
        color: Colors.white,
      ),
      child: widget.direction == 'horizontal' ? Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: buildHorizontal(),
      ) : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buildVertical(),
      ),
    );
  }
}

class StepItem {
  final String title;
  final String date;

  StepItem(this.title, [this.date]);
}