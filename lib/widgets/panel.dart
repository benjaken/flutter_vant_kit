import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/cell.dart';


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
    this.desc,
    this.status,
    this.body,
    this.footer
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Style.panelBackgroundColor,
              border: Border(
                top: BorderSide(width: Style.borderWidthBase, color: Style.borderColor),
                bottom: BorderSide(width: Style.borderWidthBase, color: Style.borderColor),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Cell(
                  title: title??"",
                  label: desc??"",
                  customRight: Text(status??"", style: TextStyle(
                    fontSize: Style.panelHeaderValueFontSize,
                    color: Style.panelHeaderValueColor
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(left: Style.panelContentPadding),
                  padding: EdgeInsets.only(top: Style.panelContentPadding, bottom: Style.panelContentPadding, right: Style.panelContentPadding),
                  alignment: AlignmentDirectional.centerStart,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: Style.borderWidthBase, color: Style.borderColor),
                    )
                  ),
                  child: body,
                )
              ],
            ),
          ),
          footer != null ? Container(
            padding: Style.panelFooterPadding,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: Style.borderWidthBase, color: Style.borderColor),
              )
            ),
            child: footer,
          ) : Container()
        ],
      ),
    );
  }
}