import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoPagination extends StatefulWidget {
  @override
  _DemoPagination createState() => _DemoPagination();
}

class _DemoPagination extends State<DemoPagination> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title("基础用法"),
        Pagination(
          totalItems: 36,
        ),
        title("简单模式"),
        Pagination(
          totalItems: 120,
          mode: 'simple',
        ),
        // title("显示省略号"),
        // Pagination(
        //   totalItems: 120,
        // )
      ],
    ));
  }
}
