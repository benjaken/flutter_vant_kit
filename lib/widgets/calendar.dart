import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Calendar {
  // 选择类型
  final String type;
  // 日历标题
  final String title;
  // 颜色，对底部按钮和选中日期生效
  final Color? color;
  // 最小日期
  final DateTime? minDate;
  // 最大日期
  final DateTime? maxDate;
  // 默认选中的日期
  final dynamic defaultDate;
  // 日期行高
  final double rowHeight;
  // 是否以弹层的形式展示日历
  final bool poppable;
  // 是否显示圆角弹窗
  final bool round;
  // 是否显示月份背景水印
  final bool showMark;
  // 是否展示确认按钮
  final bool showConfirm;
  // 是否在点击遮罩层后关闭
  final bool closeOnClickOverlay;
  // 确认按钮的文字
  final String confirmText;
  // 日程高度，当poppable为false时生效
  final double height;
  // 点击任意日期时触发
  final Function(dynamic date)? onSelect;
  // 日期选择完成后触发
  final Function(dynamic date)? onConfirm;

  const Calendar(
      {Key? key,
      this.type: "single",
      this.title: "日期选择",
      this.color,
      this.minDate,
      this.maxDate,
      this.defaultDate,
      this.rowHeight: Style.calendarDayHeight,
      this.poppable: true,
      this.round: true,
      this.showMark: true,
      this.showConfirm: true,
      this.closeOnClickOverlay: true,
      this.confirmText: "确定",
      this.height: Style.calendarHeight,
      this.onSelect,
      this.onConfirm})
      : assert(type == 'single' || type == 'range',
            "type must be single or range");

  show(BuildContext context) {
    return poppable
        ? showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isDismissible: closeOnClickOverlay,
            builder: (BuildContext context) {
              return CalendarState(this);
            })
        : CalendarState(this);
  }
}

class CalendarState extends StatefulWidget {
  final Calendar calendar;

  const CalendarState(this.calendar);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<CalendarState> {
  List weekdays = ["日", "一", "二", "三", "四", "五", "六"];
  late Calendar _calendar;
  dynamic _defaultDate;
  dynamic _currentDate;
  DateTime? _minDate;
  late DateTime _maxDate;
  DateTime? _startDate;
  DateTime? _endDate;
  String _startString = "开始";
  String _endString = "结束";
  int? _displayYear;
  int? _displayMonth;
  ScrollController _scrollController = new ScrollController();
  bool _isRange = false;

  @override
  void initState() {
    super.initState();
    _calendar = widget.calendar;
    _isRange = _calendar.type == 'range';
    _defaultDate = _calendar.defaultDate ?? (_isRange ? [] : null);
    _minDate = _calendar.minDate ?? DateTime.now();
    _maxDate = _calendar.maxDate ?? DateTime.now().add(Duration(days: 180));
    if (_isRange && _defaultDate.length > 0) {
      _startDate = DateTime(
          _defaultDate[0].year, _defaultDate[0].month, _defaultDate[0].day);
      _endDate = DateTime(
          _defaultDate[1].year, _defaultDate[1].month, _defaultDate[1].day);
    } else {
      _currentDate = _defaultDate ?? _minDate;
    }
    _displayYear =
        _isRange ? (_startDate ?? _minDate)!.year : _currentDate.year;
    _displayMonth =
        _isRange ? (_startDate ?? _minDate)!.month : _currentDate.month;

    _scrollController..addListener(_scrollListener);
    WidgetsBinding.instance!.addPostFrameCallback(_onLayoutDone);
  }

  void _scrollListener() {
    double offset = _scrollController.offset;
    int month = offset ~/ (Style.calendarDayHeight * 5.5);
    int baseYear = _minDate!.year;
    int baseMonth = _minDate!.month;
    setState(() {
      _displayMonth =
          month + baseMonth > 12 ? month + baseMonth - 12 : month + baseMonth;
      _displayYear = month + baseMonth > 12 ? baseYear + 1 : baseYear;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
  }

  int getDifferentMonth(DateTime start, DateTime end) {
    return (end.year - start.year) * 12 + (end.month - start.month) + 1;
  }

  void _onLayoutDone(_) {
    DateTime currentDate = _isRange ? (_startDate ?? _minDate!) : _currentDate;
    int scrollIndex = getDifferentMonth(_minDate!, currentDate) - 1;
    if (scrollIndex > 0) {
      double scrollLength =
          (scrollIndex * (Style.calendarDayHeight * 5.5)).toDouble();
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
          child: Text(_calendar.title,
              style: TextStyle(
                  fontSize: Style.calendarTitleFontSize,
                  color: Style.calendarFontColor,
                  fontWeight: FontWeight.bold)),
        ),
        _calendar.poppable
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

  Widget buildMonthTitle(int? year, int? month) {
    return Container(
      alignment: AlignmentDirectional.center,
      height: Style.calendarTitleHeight,
      child: Text("$year年$month月",
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
              top: Radius.circular(_calendar.round && _calendar.poppable
                  ? Style.calendarBorderRadius
                  : 0)),
          color: Style.calendarBackgroundColor,
          boxShadow: [Style.calendarHeaderBoxShadow]),
      child: Column(
        children: <Widget>[
          buildTitle(),
          buildMonthTitle(_displayYear, _displayMonth),
          buildWeekdays()
        ],
      ),
    );
  }

  Widget buildCalendar() {
    return _calendar.poppable
        ? Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                child: buildCalendarContent(),
              ),
            ),
          )
        : Container(
            height: _calendar.height,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: buildCalendarContent(),
            ),
          );
  }

  Widget buildCalendarContent() {
    int monthLength = getDifferentMonth(_minDate!, _maxDate);
    return Container(
      padding: EdgeInsets.only(
          top: Style.paddingXs,
          bottom: _calendar.showConfirm
              ? Style.paddingXs + (Style.calendarConfirmButtonHeight + 7 * 2)
              : Style.paddingXs),
      child: Column(
        children: List.generate(monthLength, (i) {
          return buildCalendarItems(i);
        }),
      ),
    );
  }

  Widget buildCalendarItems(int i) {
    int baseYear = _minDate!.year;
    int baseMonth = _minDate!.month;
    int currentMonth = i + baseMonth > 12 ? i + baseMonth - 12 : i + baseMonth;
    int currentYear = i + baseMonth > 12 ? baseYear + 1 : baseYear;
    int lastDay = DateTime(currentYear, currentMonth + 1, 0).day;
    int emptyDays = DateTime(currentYear, currentMonth, 1).weekday;
    emptyDays = emptyDays == 7 ? 0 : emptyDays;
    return Stack(
      children: <Widget>[
        _calendar.showMark
            ? Positioned(
                top: Style.calendarConfirmButtonHeight +
                    (currentMonth == _minDate!.month
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
                ))
            : Container(),
        Container(
          child: Column(
            children: <Widget>[
              currentMonth == _minDate!.month
                  ? Container()
                  : buildMonthTitle(currentYear, currentMonth),
              Wrap(
                children: List.generate(lastDay + emptyDays, (i) {
                  int day = i - emptyDays + 1;
                  return buildCalendarItem(currentYear, currentMonth, day);
                }),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildCalendarItem(int year, int month, int day) {
    bool isSelected = _calendar.type == "single" &&
        month == _currentDate.month &&
        day == _currentDate.day;
    DateTime currentDate = DateTime(year, month, day);
    double dayItemWidth = MediaQuery.of(context).size.width / 7;
    dayItemWidth = dayItemWidth.toInt().toDouble();
    bool isEmpty = day < 1;
    bool isDisabled = currentDate.isBefore(
            DateTime(_minDate!.year, _minDate!.month, _minDate!.day)) ||
        currentDate
            .isAfter(DateTime(_maxDate.year, _maxDate.month, _maxDate.day));
    bool isStart = false;
    bool isEnd = false;
    bool isCenter = false;
    if (_isRange && _startDate != null) {
      isStart = month == _startDate!.month && day == _startDate!.day;
    }
    if (_isRange && _endDate != null) {
      isEnd = month == _endDate!.month && day == _endDate!.day;
    }
    if (_isRange && _startDate != null && _endDate != null && !isEmpty) {
      isCenter =
          currentDate.isAfter(_startDate!) && currentDate.isBefore(_endDate!);
    }
    String info = isStart
        ? _startString
        : isEnd
            ? _endString
            : '';
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
              ? _calendar.color ?? Style.calendarSelectedDayBackgroundColor
              : isCenter
                  ? (_calendar.color ??
                          Style.calendarSelectedDayBackgroundColor)
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
            height: _calendar.rowHeight,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Text("${isEmpty ? '' : day}",
                      style: TextStyle(
                          fontSize: Style.calendarDayFontSize,
                          color: isSelected || isStart || isEnd
                              ? Style.calendarSelectedDayColor
                              : isCenter
                                  ? _calendar.color ??
                                      Style.calendarSelectedDayBackgroundColor
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
              if (_isRange) {
                if (_startDate == null ||
                    currentDate.isBefore(_startDate!) ||
                    _startDate != null && _endDate != null) {
                  _endDate = null;
                  _startDate = currentDate;
                }
                if (_startDate != null &&
                    _endDate == null &&
                    currentDate.isAfter(_startDate!)) {
                  _endDate = currentDate;
                }
                if (_calendar.onSelect != null &&
                    _startDate != null &&
                    _endDate != null) {
                  _calendar.onSelect!([_startDate, _endDate]);
                }
                if (!_calendar.showConfirm &&
                    _calendar.onConfirm != null &&
                    _startDate != null &&
                    _endDate != null) {
                  close(context);
                  _calendar.onConfirm!([_startDate, _endDate]);
                }
              } else {
                _currentDate = currentDate;
                if (_calendar.onSelect != null) {
                  _calendar.onSelect!(_currentDate);
                }
                if (!_calendar.showConfirm && _calendar.onConfirm != null) {
                  close(context);
                  _calendar.onConfirm!(_currentDate);
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
          color: _calendar.color,
          text: _calendar.confirmText,
          round: true,
          onClick: () {
            close(context);
            if (_calendar.onConfirm != null) {
              if (_startDate != null && _endDate != null) {
                _calendar.onConfirm!([_startDate, _endDate]);
              } else if (_currentDate != null) {
                _calendar.onConfirm!(_currentDate);
              }
            }
          },
        ),
      ),
    );
  }

  Widget buildContent() {
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[buildTop(), buildCalendar()],
          ),
        ),
        _calendar.showConfirm ? buildConfirmButton() : Container()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(_calendar.round && _calendar.poppable
                ? Style.calendarBorderRadius
                : 0)),
        color: Style.calendarBackgroundColor,
      ),
      child: _calendar.poppable
          ? SafeArea(
              child: buildContent(),
            )
          : buildContent(),
    );
  }
}

class DayItem {
  final DateTime? date;
  final String? info;
  final bool disabled;

  DayItem({this.date, this.info, this.disabled: false});
}
