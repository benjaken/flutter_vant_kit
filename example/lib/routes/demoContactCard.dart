import 'package:example/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoContactCard extends StatefulWidget {
  @override
  _DemoContactCard createState() => _DemoContactCard();
}

class _DemoContactCard extends State<DemoContactCard> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title("添加联系人"),
          ContactCard(type: 'add', onClick: () => {Utils.toast('新增')}),
          title("编辑联系人"),
          ContactCard(
            type: 'edit',
            name: '张三',
            tel: '13000000000',
            onClick: () => {Utils.toast('编辑')},
          ),
          title("不可编辑"),
          ContactCard(
              type: 'edit', name: '张三', tel: '13000000000', editAble: false)
        ],
      ),
    );
  }
}
