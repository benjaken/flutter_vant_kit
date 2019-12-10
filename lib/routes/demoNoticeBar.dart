import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/noticeBar.dart';

class demoNoticeBar extends StatefulWidget{
  @override
  _demoNoticeBar createState() => _demoNoticeBar();
}


class _demoNoticeBar extends State<demoNoticeBar>{
  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 30, 0, 10),
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
    return ListView(
      children: <Widget>[
          Title("基础用法"),
          NoticeBar(
            text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
            leftIcon: Icons.volume_up,
          ),
          Title("禁止滚动"),
          NoticeBar(
            scrollable: false,
            text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
          ),
          Title("多行展示"),
          NoticeBar(
            scrollable: false,
            wrapable: true,
            text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
          ),
          Title("通知栏模式"),
          NoticeBar(
            text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
            mode: "closeable",
            onClose: () {
              print("NoticeBar closed");
            },
          ),
          SizedBox(height: 4,),
          NoticeBar(
            text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
            mode: "link",
            onClick: () {
              print("NoticeBar clicked");
            },
          ),
          Title("自定义样式"),
          NoticeBar(
            text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
            leftIcon: Icons.info_outline,
            background: Colors.blue,
            color: Colors.blue,
          )
      ],
    );
  }
}