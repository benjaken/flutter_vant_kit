import 'package:flutter/material.dart';


class Panel extends StatelessWidget {
  // 标题
  final String title;
  // 描述
  final String desc;
  // 状态
  final String status;
  // 自定义内容
  final Widget body;
  // 自定义 footer
  final Widget footer;

  Panel({
    Key key,
    @required this.title,
    this.desc: "",
    this.status: "",
    this.body,
    this.footer
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xffebedf0)),
                bottom: BorderSide(width: 1.0, color: Color(0xffebedf0)),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(title, style: TextStyle(
                      fontSize: 14
                    )),
                    Text(status, style: TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent
                    ))
                  ],
                ),
                SizedBox(height: 4.0),
                Text(desc, style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey
                )),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  alignment: AlignmentDirectional.centerStart,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xffebedf0)),
                    )
                  ),
                  child: body,
                )
              ],
            ),
          ),
          footer != null ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xffebedf0)),
              )
            ),
            child: footer,
          ) : Container()
        ],
      ),
    );
  }
}