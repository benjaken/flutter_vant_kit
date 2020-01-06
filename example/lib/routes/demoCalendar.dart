import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCalendar extends StatefulWidget {
  @override
  _DemoCalendar createState() => _DemoCalendar();
}

class _DemoCalendar extends State<DemoCalendar> {
  DateTime _selectedDate1;
  List<DateTime> _selectedDate2;
  DateTime _selectedDate3;
  List<DateTime> _selectedDate4;
  List<DateTime> _selectedDate5;
  DateTime _selectedDate6;
  DateTime _selectedDate7;
  DateTime _selectedDate8;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  void showCalendar(Widget content) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return content;
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          title("基础用法"),
          CellGroup(
            children: <Widget>[
              Cell(
                title: "选择单个日期",
                value: _selectedDate1 != null
                    ? DateFormat('yyyy/MM/dd').format(_selectedDate1)
                    : '',
                isLink: true,
                onClick: () => showCalendar(Calendar(
                  defaultDate: _selectedDate1,
                  onConfirm: (date) {
                    setState(() {
                      _selectedDate1 = date;
                    });
                  },
                )),
              ),
              Cell(
                title: "选择日期区间",
                value: _selectedDate2 != null
                    ? "${DateFormat('MM/dd').format(_selectedDate2[0])} - ${DateFormat('MM/dd').format(_selectedDate2[1])}"
                    : '',
                isLink: true,
                onClick: () => showCalendar(
                  Calendar(
                    type: "range",
                    defaultDate: _selectedDate2,
                    onConfirm: (date) {
                      setState(() {
                        _selectedDate2 = date;
                      });
                    },
                  )
                ),
              ),
            ],
          ),
          title("快捷选择"),
          CellGroup(
            children: <Widget>[
              Cell(
                title: "选择单个日期",
                value: _selectedDate3 != null
                    ? DateFormat('yyyy/MM/dd').format(_selectedDate3)
                    : '',
                isLink: true,
                onClick: () => showCalendar(Calendar(
                  showConfirm: false,
                  defaultDate: _selectedDate3,
                  onConfirm: (date) {
                    setState(() {
                      _selectedDate3 = date;
                    });
                  },
                )),
              ),
              Cell(
                title: "选择日期区间",
                value: _selectedDate4 != null
                    ? "${DateFormat('MM/dd').format(_selectedDate4[0])} - ${DateFormat('MM/dd').format(_selectedDate4[1])}"
                    : '',
                isLink: true,
                onClick: () => showCalendar(
                  Calendar(
                    type: "range",
                    showConfirm: false,
                    defaultDate: _selectedDate4,
                    onConfirm: (date) {
                      setState(() {
                        _selectedDate4 = date;
                      });
                    },
                  )
                ),
              ),
            ],
          ),
          title("自定义日历"),
          CellGroup(
            children: <Widget>[
              Cell(
                title: "自定义颜色",
                isLink: true,
                value: _selectedDate5 != null
                    ? "${DateFormat('MM/dd').format(_selectedDate5[0])} - ${DateFormat('MM/dd').format(_selectedDate5[1])}"
                    : '',
                onClick: () => showCalendar(Calendar(
                  color: Colors.green,
                  type: "range",
                  defaultDate: _selectedDate5,
                  onConfirm: (date) {
                    setState(() {
                      _selectedDate5 = date;
                    });
                  },
                )),
              ),
              Cell(
                title: "自定义日期范围",
                isLink: true,
                value: _selectedDate6 != null
                    ? DateFormat('yyyy/MM/dd').format(_selectedDate6)
                    : '',
                onClick: () => showCalendar(Calendar(
                  defaultDate: _selectedDate6,
                  minDate: DateFormat('yyyy-MM-dd').parse("2010-01-01"),
                  maxDate: DateFormat('yyyy-MM-dd').parse("2010-01-31"),
                  onConfirm: (date) {
                    setState(() {
                      _selectedDate6 = date;
                    });
                  },
                )),
              ),
              Cell(
                title: "自定义按钮文字",
                isLink: true,
                value: _selectedDate7 != null
                    ? DateFormat('yyyy/MM/dd').format(_selectedDate7)
                    : '',
                onClick: () => showCalendar(Calendar(
                  confirmText: "完成",
                  defaultDate: _selectedDate7,
                  onConfirm: (date) {
                    setState(() {
                      _selectedDate7 = date;
                    });
                  },
                )),
              ),
              // Cell(
              //   title: "自定义日期文案",
              //   isLink: true,
              //   onClick: () => showCalendar(
              //     Calendar(
              //       showConfirm: false,
              //       defaultDate: _selectedDate3 != null ? DateFormat("yyyy/MM/dd").parse(_selectedDate3) : null,
              //       onConfirm: (date) {
              //         print(date);
              //         setState(() {
              //           _selectedDate3 = DateFormat("yyyy/MM/dd").format(date);
              //         });
              //       },
              //     )
              //   ),
              // )
            ],
          ),
          title("平铺展示"),
          Calendar(
            poppable: false,
            showConfirm: false,
            title: "日历",
            type: "range",
            defaultDate: [
              DateFormat('yyyy-MM-dd').parse("2012-01-10"),
              DateFormat('yyyy-MM-dd').parse("2012-01-12")
            ],
            minDate: DateFormat('yyyy-MM-dd').parse("2012-01-10"),
            maxDate: DateFormat('yyyy-MM-dd')
                .parse("2012-01-10")
                .add(Duration(days: 70)),
            onSelect: (date) {
              Utils.toast(date.toString());
            },
          ),
        ]));
  }
}
