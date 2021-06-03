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
        CellGroup(border: false, children: <Widget>[
          Cell(title: 'default类型', customRight: Tag(text: "标签")),
          Cell(
              title: 'primary类型',
              customRight: Tag(type: "primary", text: "标签")),
          Cell(
              title: 'success类型',
              customRight: Tag(type: "success", text: "标签")),
          Cell(title: 'danger类型', customRight: Tag(type: "danger", text: "标签")),
          Cell(
              title: 'warning类型',
              customRight: Tag(type: "warning", text: "标签")),
        ]),
        title("样式风格"),
        CellGroup(border: false, children: <Widget>[
          Cell(
              title: '空心样式',
              customRight: Tag(type: "primary", text: "标签", plain: true)),
          Cell(
              title: '圆角样式',
              customRight: Tag(type: "primary", text: "标签", round: true)),
          Cell(
              title: '标记样式',
              customRight: Tag(type: "primary", text: "标签", mark: true)),
          Cell(
              title: '可关闭标签',
              customRight: Tag(
                type: "primary",
                text: "标签",
                onClose: () async {
                  Utils.toast("close");
                },
              )),
        ]),
        title("标签大小"),
        CellGroup(border: false, children: <Widget>[
          Cell(title: '小号标签', customRight: Tag(type: "primary", text: "标签")),
          Cell(
              title: '中号标签',
              customRight: Tag(type: "primary", text: "标签", size: "medium")),
          Cell(
              title: '大号标签',
              customRight: Tag(type: "primary", text: "标签", size: "large"))
        ]),
        title("自定义颜色"),
        CellGroup(border: false, children: <Widget>[
          Cell(
              title: '背景颜色',
              customRight:
                  Tag(type: "primary", text: "标签", color: Colors.purple)),
          Cell(
              title: '文字颜色',
              customRight: Tag(
                  type: "primary",
                  text: "标签",
                  color: Colors.red[100],
                  textColor: Colors.red[600])),
          Cell(
              title: '空心颜色',
              customRight: Tag(
                  type: "primary",
                  text: "标签",
                  plain: true,
                  color: Colors.purple))
        ]),
      ],
    ));
  }
}
