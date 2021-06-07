import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoTag extends StatefulWidget {
  @override
  _DemoTag createState() => _DemoTag();
}

class _DemoTag extends State<DemoTag> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title(I18n.of(context)!.basic_usage),
        CellGroup(border: false, children: <Widget>[
          Cell(
              title: I18n.of(context)!.default_type,
              customRight: Tag(text: I18n.of(context)!.tag)),
          Cell(
              title: I18n.of(context)!.primary,
              customRight: Tag(type: "primary", text: I18n.of(context)!.tag)),
          Cell(
              title: I18n.of(context)!.success,
              customRight: Tag(type: "success", text: I18n.of(context)!.tag)),
          Cell(
              title: I18n.of(context)!.danger,
              customRight: Tag(type: "danger", text: I18n.of(context)!.tag)),
          Cell(
              title: I18n.of(context)!.warning,
              customRight: Tag(type: "warning", text: I18n.of(context)!.tag)),
        ]),
        title(I18n.of(context)!.style),
        CellGroup(border: false, children: <Widget>[
          Cell(
              title: I18n.of(context)!.plain_style,
              customRight: Tag(
                  type: "primary", text: I18n.of(context)!.tag, plain: true)),
          Cell(
              title: I18n.of(context)!.round_style,
              customRight: Tag(
                  type: "primary", text: I18n.of(context)!.tag, round: true)),
          Cell(
              title: I18n.of(context)!.mark_style,
              customRight: Tag(
                  type: "primary", text: I18n.of(context)!.tag, mark: true)),
          Cell(
              title: I18n.of(context)!.closeable_tag,
              customRight: Tag(
                type: "primary",
                text: I18n.of(context)!.tag,
                onClose: () async {
                  Utils.toast("close");
                },
              )),
        ]),
        title(I18n.of(context)!.tag_size),
        CellGroup(border: false, children: <Widget>[
          Cell(
              title: I18n.of(context)!.small_tag,
              customRight: Tag(type: "primary", text: I18n.of(context)!.tag)),
          Cell(
              title: I18n.of(context)!.medium_tag,
              customRight: Tag(
                  type: "primary",
                  text: I18n.of(context)!.tag,
                  size: "medium")),
          Cell(
              title: I18n.of(context)!.large_tag,
              customRight: Tag(
                  type: "primary", text: I18n.of(context)!.tag, size: "large"))
        ]),
        title(I18n.of(context)!.custom_color),
        CellGroup(border: false, children: <Widget>[
          Cell(
              title: I18n.of(context)!.background_color,
              customRight: Tag(
                  type: "primary",
                  text: I18n.of(context)!.tag,
                  color: Colors.purple)),
          Cell(
              title: I18n.of(context)!.font_color,
              customRight: Tag(
                  type: "primary",
                  text: I18n.of(context)!.tag,
                  color: Colors.red[100],
                  textColor: Colors.red[600])),
          Cell(
              title: I18n.of(context)!.plain_color,
              customRight: Tag(
                  type: "primary",
                  text: I18n.of(context)!.tag,
                  plain: true,
                  color: Colors.purple))
        ]),
      ],
    ));
  }
}
