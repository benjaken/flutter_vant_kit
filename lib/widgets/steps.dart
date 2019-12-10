import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/divider.dart';


class Steps extends StatefulWidget {
  final List<StepItem> steps;
  final int active;
  final String direction;
  final Color activeColor;
  final IconData activeIcon;
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
    List<Widget> widgets = [];
    for (int i = 0; i < widget.steps.length; i++) {
      StepItem step = widget.steps[i];
      widgets.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(step.title, style: TextStyle(color: i == widget.active ? widget.activeColor
              : i < widget.active ? Colors.black : Colors.grey)),
            Container(
              width: 12,
              height: 12,
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsets.symmetric(vertical: 6),
              child: i == widget.active ? Icon(widget.activeIcon, color: widget.activeColor, size: 14,)
              : Icon(widget.inactiveIcon??Icons.lens, size: widget.inactiveIcon != null ? 14 : 8, color: i < widget.active ? widget.activeColor : Colors.grey),
            )
          ],
        ),
      ));
      if (i < widget.steps.length - 1) widgets.add(
        Expanded(child: NDivider(
          lineColor: i < widget.active ? widget.activeColor : Colors.grey,
        ))
      );
    }
    return widgets;
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
                  Text(step.title, style: TextStyle(fontSize: 14, color: i == widget.active ? widget.activeColor
                    : i < widget.active ? Colors.black : Colors.grey)),
                  Text(step.date, style: TextStyle(fontSize: 14, color: i == widget.active ? widget.activeColor
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
          mainAxisAlignment: MainAxisAlignment.center,
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
              //FIXME:此处高度需计算而不是固定值
              height: 34,
              color: i < widget.active ? widget.activeColor : Colors.grey,
            ) : Container()
          ],
        ),
      ));
    }
    return [
      Column(children: left),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textBaseline: TextBaseline.alphabetic,
        children: widget.direction == 'vertical' ? buildVertical() : buildHorizontal(),
      ),
    );
  }
}

class StepItem {
  final String title;
  final String date;

  StepItem(this.title, [this.date]);
}