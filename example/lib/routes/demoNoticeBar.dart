import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoNoticeBar extends StatefulWidget {
  @override
  _DemoNoticeBar createState() => _DemoNoticeBar();
}

class _DemoNoticeBar extends State<DemoNoticeBar> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 30, 0, 10),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        title("基础用法"),
        NoticeBar(
          text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
          leftIcon: Icons.volume_up,
        ),
        title("禁止滚动"),
        NoticeBar(
          scrollable: false,
          leftIcon: Icons.volume_up,
          text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
        ),
        title("多行展示"),
        NoticeBar(
          scrollable: false,
          wrapable: true,
          text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
        ),
        title("通知栏模式"),
        NoticeBar(
          text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
          mode: "closeable",
          onClose: () {
            Utils.toast("NoticeBar closed");
          },
        ),
        SizedBox(
          height: 4,
        ),
        NoticeBar(
          text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
          mode: "link",
          onClick: () {
            Utils.toast("NoticeBar clicked");
          },
        ),
        title("自定义样式"),
        NoticeBar(
          text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。",
          leftIcon: Icons.info_outline,
          background: Color(0xffecf9ff),
          color: Color(0xff1989fa),
        )
      ],
    );
  }
}
