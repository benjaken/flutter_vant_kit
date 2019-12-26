import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';
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

  Steps(
      {Key key,
      @required this.steps,
      this.active: 0,
      this.direction: 'horizontal',
      this.activeColor: Style.stepFinishLineColor,
      this.activeIcon: Icons.check_circle,
      this.inactiveIcon})
      : assert(steps.length > 0, '步骤数量必须大于零');

  @override
  _Steps createState() => _Steps();
}

class _Steps extends State<Steps> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildHorizontalTop(StepItem step, int i) {
    return Container(
      margin: EdgeInsets.only(bottom: Style.paddingXs),
      child: Text(step.title ?? "",
          style: TextStyle(
              fontSize: Style.stepHorizontalTitleFontSize,
              color: i == widget.active
                  ? widget.activeColor
                  : i < widget.active
                      ? Style.stepFinishTextColor
                      : Style.stepTextColor)),
    );
  }

  Widget buildHorizontalBottom(StepItem step, int i) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: i == 0
          ? EdgeInsets.only(right: Style.paddingSm)
          : i == widget.steps.length - 1
              ? EdgeInsets.only(left: Style.paddingSm)
              : EdgeInsets.symmetric(horizontal: Style.paddingSm),
      child: i == widget.active
          ? Icon(
              widget.activeIcon,
              color: widget.activeColor,
              size: Style.stepIconSize,
            )
          : Icon(widget.inactiveIcon ?? Icons.lens,
              size: widget.inactiveIcon != null
                  ? Style.stepIconSize
                  : Style.stepCircleSize,
              color: i < widget.active
                  ? widget.activeColor
                  : Style.stepCircleColor),
    );
  }

  List<Widget> buildHorizontal() {
    List<Widget> tops = [];
    List<Widget> bottoms = [];
    for (int i = 0; i < widget.steps.length; i++) {
      StepItem step = widget.steps[i];
      tops.add(buildHorizontalTop(step, i));
      bottoms.add(buildHorizontalBottom(step, i));
      if (i < widget.steps.length - 1)
        bottoms.add(Expanded(
          child: NDivider(
            lineColor:
                i < widget.active ? widget.activeColor : Style.stepLineColor,
          ),
        ));
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

  Widget buildVerticalLeft(StepItem step, int i) {
    return Container(
      width: Style.stepVerticalProgressWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.symmetric(vertical: Style.paddingXs),
            child: (i == widget.active)
                ? Icon(
                    widget.activeIcon,
                    color: widget.activeColor,
                    size: Style.stepIconSize,
                  )
                : Icon(widget.inactiveIcon ?? Icons.lens,
                    size: widget.inactiveIcon != null
                        ? Style.stepIconSize
                        : Style.stepCircleSize,
                    color: i < widget.active
                        ? widget.activeColor
                        : Style.stepCircleColor),
          ),
          (i < widget.steps.length - 1)
              ? Container(
                  width: 1,
                  height: 37,
                  color: i < widget.active
                      ? widget.activeColor
                      : Style.stepLineColor,
                )
              : Container()
        ],
      ),
    );
  }

  Widget buildVerticalRight(StepItem step, int i) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Style.paddingXs),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: Style.paddingSm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(step.title ?? "",
                      style: TextStyle(
                          fontSize: Style.stepFontSize,
                          color: i == widget.active
                              ? widget.activeColor
                              : i < widget.active
                                  ? Style.stepProcessTextColor
                                  : Style.stepTextColor)),
                  Text(step.date ?? "",
                      style: TextStyle(
                          fontSize: Style.stepFontSize,
                          color: i == widget.active
                              ? widget.activeColor
                              : i < widget.active
                                  ? Style.stepProcessTextColor
                                  : Style.stepTextColor)),
                ],
              )),
          (i < widget.steps.length - 1) ? NDivider() : Container()
        ],
      ),
    );
  }

  List<Widget> buildVertical() {
    List<Widget> left = [];
    List<Widget> right = [];
    for (int i = 0; i < widget.steps.length; i++) {
      StepItem step = widget.steps[i];
      left.add(buildVerticalLeft(step, i));
      right.add(buildVerticalRight(step, i));
    }
    return [
      Container(
        padding: EdgeInsets.symmetric(vertical: Style.paddingXs),
        child: Column(children: left),
      ),
      Expanded(
        child: Column(
          children: right,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Style.stepsPadding,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              width: Style.stepsBorderWidth, color: Style.stepsBorderColor),
          bottom: BorderSide(
              width: Style.stepsBorderWidth, color: Style.stepsBorderColor),
        ),
        color: Style.stepsBackgroundColor,
      ),
      child: widget.direction == 'horizontal'
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: buildHorizontal(),
            )
          : Row(
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
