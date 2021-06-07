import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCollapse extends StatefulWidget {
  @override
  _DemoCollapse createState() => _DemoCollapse();
}

class _DemoCollapse extends State<DemoCollapse> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
        Collapse(
          list: [
            CollapseItem(
              title: I18n.of(context)!.title,
              content: "I18n.of(context)!.example_content",
            ),
            CollapseItem(
              title: I18n.of(context)!.title,
              content: "I18n.of(context)!.example_content",
            ),
            CollapseItem(
              title: I18n.of(context)!.title,
              label: I18n.of(context)!.disabled_click,
              clickable: false,
              content: "I18n.of(context)!.example_content",
            )
          ],
          onChange: (List? list) {
            Utils.toast("Expanded! $list");
          },
        ),
        title(I18n.of(context)!.accordion),
        Collapse(
          accordion: true,
          name: ['0'],
          list: [
            CollapseItem(
              title: I18n.of(context)!.title,
              content: "I18n.of(context)!.example_content",
            ),
            CollapseItem(
              title: I18n.of(context)!.title,
              content: "I18n.of(context)!.example_content",
            ),
            CollapseItem(
              title: I18n.of(context)!.title,
              content: "I18n.of(context)!.example_content",
            )
          ],
        ),
        title(I18n.of(context)!.custom_content),
        Collapse(
          border: false,
          list: [
            CollapseItem(
              title: I18n.of(context)!.title,
              customTitle: Padding(
                padding: EdgeInsets.only(left: 6),
                child: Icon(Icons.info_outline,
                    color: Colors.blueAccent, size: 16),
              ),
              name: 'a',
              rightIcon:
                  Icon(Icons.favorite, size: 16, color: Colors.blueAccent),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text("I18n.of(context)!.example_content",
                    style: TextStyle(color: Colors.red, fontSize: 12)),
              ),
            ),
            CollapseItem(
              title: I18n.of(context)!.title,
              name: 'b',
              value: I18n.of(context)!.content,
              icon: Icons.store,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
