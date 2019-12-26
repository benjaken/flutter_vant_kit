import 'package:flutter/material.dart';
import 'package:flutter_kit/utils/index.dart';

import 'package:flutter_kit/widgets/collapse.dart';
import 'package:flutter_kit/widgets/collapseItem.dart';


class demoCollapse extends StatefulWidget{
  @override
  _demoCollapse createState() => _demoCollapse();
}


class _demoCollapse extends State<demoCollapse>{
  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("基础用法"),
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
            onChange: (List list) {
              Utils.toast("Expanded! $list");
            },
          ),
          Title("手风琴"),
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
          Title("自定义标题内容"),
          Collapse(
            border: false,
            list: [
              CollapseItem(
                title: "标题1",
                customTitle: Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Icon(Icons.info_outline, color: Colors.blueAccent, size: 16),
                ),
                name: 'a',
                rightIcon: Icon(Icons.favorite, size: 16, color: Colors.blueAccent),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("代码是写出来给人看的，附带能在机器上运行", style: TextStyle(color: Colors.red, fontSize: 12)),
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
      )
    );
  }
}