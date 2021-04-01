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
        title("基础用法"),
        Collapse(
          list: [
            CollapseItem(
              title: "标题1",
              content: "代码是写出来给人看的，附带能在机器上运行",
            ),
            CollapseItem(
              title: "标题2",
              content: "代码是写出来给人看的，附带能在机器上运行",
            ),
            CollapseItem(
              title: "标题3",
              label: "不能点击",
              clickable: false,
              content: "代码是写出来给人看的，附带能在机器上运行",
            )
          ],
          onChange: (List? list) {
            Utils.toast("Expanded! $list");
          },
        ),
        title("手风琴"),
        Collapse(
          accordion: true,
          name: ['0'],
          list: [
            CollapseItem(
              title: "标题1",
              content: "代码是写出来给人看的，附带能在机器上运行",
            ),
            CollapseItem(
              title: "标题2",
              content: "代码是写出来给人看的，附带能在机器上运行",
            ),
            CollapseItem(
              title: "标题3",
              content: "代码是写出来给人看的，附带能在机器上运行",
            )
          ],
        ),
        title("自定义标题内容"),
        Collapse(
          border: false,
          list: [
            CollapseItem(
              title: "标题1",
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
                child: Text("代码是写出来给人看的，附带能在机器上运行",
                    style: TextStyle(color: Colors.red, fontSize: 12)),
              ),
            ),
            CollapseItem(
              title: "标题2",
              name: 'b',
              value: "内容",
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
