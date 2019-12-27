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
        title("基础用法"),
        Row(
          children: <Widget>[
            Tag(text: "标签"),
            Tag(type: "primary", text: "标签"),
            Tag(type: "success", text: "标签"),
            Tag(type: "danger", text: "标签"),
            Tag(type: "warning", text: "标签"),
          ],
        ),
        title("圆角样式"),
        Row(
          children: <Widget>[
            Tag(
              text: "标签",
              round: true,
            ),
            Tag(
              type: "primary",
              text: "标签",
              round: true,
            ),
            Tag(
              type: "success",
              text: "标签",
              round: true,
            ),
            Tag(
              type: "danger",
              text: "标签",
              round: true,
            ),
            Tag(
              type: "warning",
              text: "标签",
              round: true,
            ),
          ],
        ),
        title("标记样式"),
        Row(
          children: <Widget>[
            Tag(
              text: "标签",
              mark: true,
            ),
            Tag(
              type: "primary",
              text: "标签",
              mark: true,
            ),
            Tag(
              type: "success",
              text: "标签",
              mark: true,
            ),
            Tag(
              type: "danger",
              text: "标签",
              mark: true,
            ),
            Tag(
              type: "warning",
              text: "标签",
              mark: true,
            ),
          ],
        ),
        title("空心样式"),
        Row(
          children: <Widget>[
            Tag(
              text: "标签",
              plain: true,
            ),
            Tag(
              type: "primary",
              text: "标签",
              plain: true,
            ),
            Tag(
              type: "success",
              text: "标签",
              plain: true,
            ),
            Tag(
              type: "danger",
              text: "标签",
              plain: true,
            ),
            Tag(
              type: "warning",
              text: "标签",
              plain: true,
            ),
          ],
        ),
        title("自定义颜色"),
        Row(children: <Widget>[
          Tag(color: Colors.pinkAccent, text: "标签"),
          Tag(color: Colors.pinkAccent, plain: true, text: "标签"),
          Tag(color: Colors.purple, text: "标签"),
          Tag(color: Colors.purple, plain: true, text: "标签"),
          Tag(color: Colors.red[100], textColor: Colors.red[600], text: "标签"),
        ]),
        title("标签大小"),
        Row(children: <Widget>[
          Tag(
            text: "标签",
            type: "success",
          ),
          Tag(
            text: "标签",
            size: "medium",
            type: "success",
          ),
          Tag(
            text: "标签",
            size: "large",
            type: "success",
          ),
        ]),
        title("可关闭标签"),
        Row(children: <Widget>[
          Tag(
            text: "标签",
            onClose: () async {
              Utils.toast("close");
            },
          ),
          Tag(
            type: "primary",
            text: "标签",
            onClose: () async {
              Utils.toast("close");
            },
          ),
          Tag(
            plain: true,
            round: true,
            type: "primary",
            text: "标签",
            onClose: () async {
              Utils.toast("close");
            },
          )
        ])
      ],
    ));
  }
}
