import 'package:example/generated/i18n.dart';
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
        title(I18n.of(context)!.basic_usage),
        NoticeBar(
          text: I18n.of(context)!.example_notice_bar,
          leftIcon: Icons.volume_up,
        ),
        title(I18n.of(context)!.no_scrolling),
        NoticeBar(
          scrollable: false,
          leftIcon: Icons.volume_up,
          text: I18n.of(context)!.example_notice_bar,
        ),
        title(I18n.of(context)!.multi_line_display),
        NoticeBar(
          scrollable: false,
          wrapable: true,
          text: I18n.of(context)!.example_notice_bar,
        ),
        title(I18n.of(context)!.notice_bar_mode),
        NoticeBar(
          text: I18n.of(context)!.example_notice_bar,
          mode: "closeable",
          onClose: () {
            Utils.toast("NoticeBar closed");
          },
        ),
        SizedBox(
          height: 4,
        ),
        NoticeBar(
          text: I18n.of(context)!.example_notice_bar,
          mode: "link",
          onClick: () {
            Utils.toast("NoticeBar clicked");
          },
        ),
        title(I18n.of(context)!.custom_style),
        NoticeBar(
          text: I18n.of(context)!.example_notice_bar,
          leftIcon: Icons.info_outline,
          background: Color(0xffecf9ff),
          color: Color(0xff1989fa),
        )
      ],
    );
  }
}
