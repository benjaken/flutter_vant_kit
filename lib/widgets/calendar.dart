import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Calendar extends StatefulWidget {
  // 选择类型
  final String type;
  // 日历标题
  final String title;
  // 颜色，对底部按钮和选中日期生效
  final Color color;
  // 最小日期
  final DateTime minDate;
  // 最大日期
  final DateTime maxDate;
  // 默认选中的日期
  final dynamic defaultDate;
  // 日期行高
  final double rowHeight;
  // 是否以弹层的形式展示日历
  final bool poppable;
  // 是否显示圆角弹窗
  final bool round;
  // 是否展示确认按钮
  final bool showConfirm;
  // 确认按钮的文字
  final String confirmText;
  // 日程高度，当poppable为false时生效
  final double height;
  // 点击任意日期时触发
  final Function(dynamic date) onSelect;
  // 日期选择完成后触发
  final Function(dynamic date) onConfirm;

  const Calendar(
      {Key key,
      this.type: "single",
      this.title: "日期选择",
      this.color,
      this.minDate,
      this.maxDate,
      this.defaultDate,
      this.rowHeight: Style.calendarDayHeight,
      this.poppable: true,
      this.round: true,
      this.showConfirm: true,
      this.confirmText: "确定",
      this.height: Style.calendarHeight,
      this.onSelect,
      this.onConfirm})
      : assert(type == 'single' || type == 'range',
            "type must be single or range"),
        super(key: key);

  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  List weekdays = ["日", "一", "二", "三", "四", "五", "六"];
  dynamic _defaultDate;
  dynamic _currentDate;
  DateTime _minDate;
  DateTime _maxDate;
  DateTime _startDate;
  DateTime _endDate;
  String _startString = "开始";
  String _endString = "结束";
  int _year;
  int _displayMonth;
  ScrollController _scrollController = new ScrollController();
  bool _isRange = false;

  @override
  void initState() {
    super.initState();
    _isRange = widget.type == 'range';
    _defaultDate = widget.defaultDate ?? (_isRange ? [] : DateTime.now());
    _minDate = widget.minDate ?? DateTime.now();
    _maxDate = widget.maxDate ?? DateTime.now().add(Duration(days: 180));
    _year = _minDate.year;
    if (_isRange && _defaultDate.length > 0) {
      _startDate = _defaultDate[0];
      _endDate = _defaultDate[1];
    } else {
      _currentDate = _defaultDate;
    }
    _displayMonth = _isRange ? (_startDate??_minDate).month : _currentDate.month;

    _scrollController..addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
  }

  void _scrollListener() {
    double offset = _scrollController.offset;
    int month = offset ~/ (Style.calendarDayHeight * 5.5);
    int baseMonth = _minDate.month;
    setState(() {
      _displayMonth = baseMonth + month;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  void _onLayoutDone(_) {
    int scrollIndex = _isRange ? (_startDate??_minDate).month : _currentDate.month;
    if (scrollIndex != null && scrollIndex > 1) {
      double scrollLength =
          ((scrollIndex - 1) * (Style.calendarDayHeight * 5.5)).toDouble();
      double maxScroll = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
          scrollLength > maxScroll ? maxScroll : scrollLength,
          duration: Style.animationDurationFast,
          curve: Curves.ease);
    }
  }

  void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget buildTitle() {
    return Stack(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          height: Style.calendarTitleHeight,
          child: Text(widget.title,
              style: TextStyle(
                  fontSize: Style.calendarTitleFontSize,
                  color: Style.calendarFontColor,
                  fontWeight: FontWeight.bold)),
        ),
        widget.poppable
            ? Positioned(
                right: 0,
                top: 0,
                child: Padding(
                  padding: EdgeInsets.all(Style.actionSheetCloseIconPadding),
                  child: GestureDetector(
                    onTap: () => close(context),
                    child: Icon(Icons.clear,
                        color: Style.actionSheetCloseIconColor,
                        size: Style.actionSheetCloseIconSize),
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  Widget buildMonthTitle(int month) {
    return Container(
      alignment: AlignmentDirectional.center,
      height: Style.calendarTitleHeight,
      child: Text("$_year年$month月",
          style: TextStyle(
              fontSize: Style.calendarMonthTitleFontSize,
              color: Style.calendarFontColor,
              fontWeight: Style.fontWeightBold)),
    );
  }

  Widget buildWeekdays() {
    return Container(
      height: Style.calendarWeekdaysHeight,
      child: Row(
        children: List.generate(weekdays.length, (i) {
          return Expanded(
            child: Center(
              child: Text(weekdays[i],
                  style: TextStyle(
                      fontSize: Style.calendarWeekdaysFontSize,
                      color: Style.calendarFontColor)),
            ),
          );
        }),
      ),
    );
  }

  Widget buildTop() {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(widget.round && widget.poppable
                  ? Style.calendarBorderRadius
                  : 0)),
          color: Style.calendarBackgroundColor,
          boxShadow: [Style.calendarHeaderBoxShadow]),
      child: Column(
        children: <Widget>[
          buildTitle(),
          buildMonthTitle(_displayMonth),
          buildWeekdays()
        ],
      ),
    );
  }

  Widget buildCalendar() {
    return widget.poppable
        ? Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                child: buildCalendarContent(),
              ),
            ),
          )
        : Container(
            height: widget.height,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: buildCalendarContent(),
            ),
          );
  }

  Widget buildCalendarContent() {
    int different = _maxDate.difference(_minDate).inDays;
    return Container(
      padding: EdgeInsets.only(
          top: Style.paddingXs,
          bottom: widget.showConfirm
              ? Style.paddingXs + (Style.calendarConfirmButtonHeight + 7 * 2)
              : Style.paddingXs),
      child: Column(
        children: List.generate((different ~/ 30) + 1, (i) {
          return buildCalendarItems(i);
        }),
      ),
    );
  }

  Widget buildCalendarItems(int i) {
    int baseMonth = _minDate.month;
    int currentMonth = i + baseMonth;
    int lastDay = DateTime(_year, currentMonth + 1, 0).day;
    int emptyDays = DateTime(_year, currentMonth, 1).weekday;
    emptyDays = emptyDays == 7 ? 0 : emptyDays;
    return Stack(
      children: <Widget>[
        Positioned(
            top: Style.calendarConfirmButtonHeight +
                (currentMonth == _minDate.month
                    ? 0
                    : Style.calendarTitleHeight),
            left: (MediaQuery.of(context).size.width -
                    Style.calendarMonthMarkSize) /
                2,
            child: Container(
              width: Style.calendarMonthMarkSize,
              height: Style.calendarMonthMarkSize,
              alignment: AlignmentDirectional.center,
              child: Text("$currentMonth",
                  style: TextStyle(
                      fontSize: Style.calendarMonthMarkFontSize,
                      fontWeight: Style.fontWeightBold,
                      color: Style.calendarMonthMarkColor)),
            )),
        Container(
          child: Column(
            children: <Widget>[
              currentMonth == _minDate.month
                  ? Container()
                  : buildMonthTitle(currentMonth),
              Wrap(
                children: List.generate(lastDay + emptyDays, (i) {
                  int day = i - emptyDays + 1;
                  return buildCalendarItem(currentMonth, day);
                }),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildCalendarItem(int month, int day) {
    bool isSelected = widget.type == "single" &&
        month == _currentDate.month &&
        day == _currentDate.day;
    double dayItemWidth = MediaQuery.of(context).size.width / 7;
    dayItemWidth = dayItemWidth.toInt().toDouble();
    bool isEmpty = day < 1;
    bool isDisabled = DateTime(_year, month, day)
            .isBefore(DateTime(_minDate.year, _minDate.month, _minDate.day)) ||
        DateTime(_year, month, day)
            .isAfter(DateTime(_maxDate.year, _maxDate.month, _maxDate.day));
    bool isStart = false;
    bool isEnd = false;
    bool isCenter = false;
    if (_isRange && _startDate != null) {
      isStart = month == _startDate.month && day == _startDate.day;
    }
    if (_isRange && _endDate != null) {
      isEnd = month == _endDate.month && day == _endDate.day;
    }
    if (_isRange && _startDate != null && _endDate != null && !isEmpty) {
      DateTime date = DateTime(_year, month, day);
      isCenter = date.isAfter(_startDate) && date.isBefore(_endDate);
    }
    String info = isStart ? _startString : isEnd ? _endString : '';
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: isStart
              ? BorderRadius.horizontal(
                  left: Radius.circular(Style.calendarDayBorderRadius))
              : isEnd
                  ? BorderRadius.horizontal(
                      right: Radius.circular(Style.calendarDayBorderRadius))
                  : BorderRadius.circular(
                      isCenter ? 0 : Style.calendarDayBorderRadius),
          color: isSelected || isStart || isEnd
              ? widget.color ?? Style.calendarSelectedDayBackgroundColor
              : isCenter
                  ? (widget.color ?? Style.calendarSelectedDayBackgroundColor)
                      .withOpacity(Style.calendarRangeMiddleBackgroundOpacity)
                  : null),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(Style.calendarDayBorderRadius),
          focusColor: isEmpty || isDisabled
              ? Style.transparent
              : Theme.of(context).focusColor,
          highlightColor: isEmpty || isDisabled
              ? Style.transparent
              : Theme.of(context).highlightColor,
          hoverColor: isEmpty || isDisabled
              ? Style.transparent
              : Theme.of(context).hoverColor,
          splashColor: isEmpty || isDisabled
              ? Style.transparent
              : Theme.of(context).splashColor,
          child: Container(
            width: dayItemWidth,
            height: widget.rowHeight,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Text("${isEmpty ? '' : day}",
                      style: TextStyle(
                          fontSize: Style.calendarDayFontSize,
                          color: isSelected || isStart || isEnd
                              ? Style.calendarSelectedDayColor
                              : isCenter
                                  ? widget.color ?? Style.calendarSelectedDayBackgroundColor
                                  : isDisabled
                                      ? Style.calendarDayDisabledColor
                                      : Style.calendarFontColor)),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 4,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(info,
                        style: TextStyle(
                            fontSize: Style.calendarInfoFontSize,
                            color: Style.calendarRangeEdgeColor)),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            if (isEmpty || isDisabled) return;
            setState(() {
              DateTime selectedDate = DateTime(_year, month, day);
              if (_isRange) {
                if (_startDate == null ||
                    selectedDate.isBefore(_startDate) ||
                    _startDate != null && _endDate != null) {
                  _endDate = null;
                  _startDate = selectedDate;
                }
                if (_startDate != null &&
                    _endDate == null &&
                    selectedDate.isAfter(_startDate)) {
                  _endDate = selectedDate;
                }
                if (widget.onSelect != null &&
                    _startDate != null &&
                    _endDate != null) {
                  widget.onSelect([_startDate, _endDate]);
                }
                if (!widget.showConfirm &&
                    widget.onConfirm != null &&
                    _startDate != null &&
                    _endDate != null) {
                  close(context);
                  widget.onConfirm([_startDate, _endDate]);
                }
              } else {
                _currentDate = selectedDate;
                if (widget.onSelect != null) {
                  widget.onSelect(_currentDate);
                }
                if (!widget.showConfirm && widget.onConfirm != null) {
                  close(context);
                  widget.onConfirm(_currentDate);
                }
              }
            });
          },
        ),
      ),
    );
  }

  Widget buildConfirmButton() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: Style.calendarConfirmPadding,
        color: Style.calendarBackgroundColor,
        child: NButton(
          height: Style.calendarConfirmButtonHeight,
          block: true,
          type: "info",
          color: widget.color,
          text: widget.confirmText,
          round: true,
          onClick: () {
            close(context);
            if (widget.onConfirm != null) {
              if (_startDate != null && _endDate != null) {
                widget.onConfirm([_startDate, _endDate]);
              } else if (_currentDate != null) {
                widget.onConfirm(_currentDate);
              }
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(widget.round && widget.poppable
                    ? Style.calendarBorderRadius
                    : 0)),
            color: Style.calendarBackgroundColor,
          ),
          child: Column(
            children: <Widget>[buildTop(), buildCalendar()],
          ),
        ),
        widget.showConfirm ? buildConfirmButton() : Container()
      ],
    );
  }
}

class DayItem {
  final DateTime date;
  final String info;
  final bool disabled;

  DayItem({
    this.date, this.info, this.disabled: false
  });
}