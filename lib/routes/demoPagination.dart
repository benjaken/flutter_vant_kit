import 'package:flutter/material.dart';

import 'package:flutter_vant_kit/widgets/pagination.dart';


class demoPagination extends StatefulWidget{
  @override
  _demoPagination createState() => _demoPagination();
}


class _demoPagination extends State<demoPagination>{
  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        title, 
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("基础用法"),
          Pagination(
            totalItems: 36,
          ),
          Title("简单模式"),
          Pagination(
            totalItems: 120,
            mode: 'simple',
          ),
          // Title("显示省略号"),
          // Pagination(
          //   totalItems: 120,
          // )
        ],
      )
    );
  }
}