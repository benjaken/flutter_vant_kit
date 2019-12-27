import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoSearch extends StatefulWidget {
  @override
  _DemoSearch createState() => _DemoSearch();
}

class _DemoSearch extends State<DemoSearch> {
  IconData _icon = Icons.star_border;
  Color _color = Colors.grey;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
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
          Search(),
          title("事件监听"),
          Search(
            showAction: true,
            onSubmitted: (val) {
              Utils.toast("searching $val");
            },
            onCancel: () {
              Utils.toast("canceled");
            },
          ),
          title("自定义样式"),
          Search(
            shape: "round",
            background: Color(0xfff2f3DA),
            showAction: true,
            maxLength: 16,
            placeholder: "请输入任何东西",
          ),
          title("自定义按钮"),
          Search(
            showAction: true,
            left: Row(
              children: <Widget>[
                Text("地址"),
                SizedBox(width: 6),
                GestureDetector(
                  child: Icon(_icon, color: _color, size: 18),
                  onTap: () {
                    setState(() {
                      _icon = Icons.star;
                      _color = Colors.orangeAccent;
                    });
                  },
                )
              ],
            ),
            rightIcon: Icons.search,
            onClickRight: () {
              Utils.toast("clicked Right Icon");
            },
            right: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Utils.toast("clicked Right");
                  },
                  child: Text("搜索"),
                ),
                SizedBox(width: 4),
                Text("收藏")
              ],
            ),
          )
        ]));
  }
}
