import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/utils/index.dart';
import 'package:flutter_vant_kit/widgets/sidebar.dart';

import 'package:flutter_vant_kit/widgets/treeSelect.dart';


class demoTreeSelect extends StatefulWidget{
  @override
  _demoTreeSelect createState() => _demoTreeSelect();
}


class _demoTreeSelect extends State<demoTreeSelect>{
  String _info = "NEW";
  int _index = 0;

  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 20),
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
    List<SideBarItem> list1 = [
      SideBarItem(
        title: "浙江",
        children: [
          TreeItem(text: "杭州", id: 1),
          TreeItem(text: "温州", id: 2),
          TreeItem(text: "宁波", id: 3, disabled: true),
          TreeItem(text: "义乌", id: 4),
        ]
      ),
      SideBarItem(
        title: "江苏",
        children: [
          TreeItem(text: "南京", id: 5),
          TreeItem(text: "无锡", id: 6),
          TreeItem(text: "徐州", id: 7),
          TreeItem(text: "苏州", id: 8),
        ]
      ),
      SideBarItem(
        title: "福建",
        disabled: true,
        children: [
          TreeItem(text: "泉州", id: 9),
          TreeItem(text: "厦门", id: 10),
        ]
      ),
    ];
    
    List<SideBarItem> list2 = [
      SideBarItem(
        title: "分组 1",
        content: Container(
          padding: EdgeInsets.all(10.0),
          child: Image.network("https://img.yzcdn.cn/vant/cat.jpeg"),
        )
      ),
      SideBarItem(
        title: "分组 2",
        content: Container(
          padding: EdgeInsets.all(10.0),
          child: Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
        )
      ),
    ];

    List<SideBarItem> list3 = [
      SideBarItem(
        title: "浙江",
        children: [
          TreeItem(text: "杭州", id: 1),
          TreeItem(text: "温州", id: 2),
          TreeItem(text: "宁波", id: 3, disabled: true),
          TreeItem(text: "义乌", id: 4),
        ],
      ),
      SideBarItem(
        title: "江苏",
        info: _info,
        children: [
          TreeItem(text: "南京", id: 5),
          TreeItem(text: "无锡", id: 6),
          TreeItem(text: "徐州", id: 7),
          TreeItem(text: "苏州", id: 8),
        ],
        // onClick: (val) {
          // setState(() {
          //   if (_info != null) {
          //     _info = null;
          //     _index = val;
          //   }
          // });
        // }
      ),
    ];
    return SingleChildScrollView(
      padding: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("单选模式"),
          TreeSelect(
            activeId: [1],
            list: list1,
          ),
          Title("多选模式"),
          TreeSelect(
            activeId: [1],
            list: list1,
            max: 3,
            onChange: (list) {
              Utils.toast(list.toString());
            },
          ),
          Title("自定义内容"),
          TreeSelect(
            list: list2,
            height: 200,
          ),
          Title("提示信息"),
          TreeSelect(
            mainActiveIndex: _index,
            list: list3,
            activeId: [1],
            height: 220,
          ),
          SizedBox(height: 20)
        ]
      )
    );
  }
}