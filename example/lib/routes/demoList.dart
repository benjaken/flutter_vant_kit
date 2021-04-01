import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoList extends StatefulWidget {
  @override
  _DemoList createState() => _DemoList();
}

class _DemoList extends State<DemoList> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<int> _dataList1 = [];
  List<int> _dataList2 = [];
  bool _finished1 = false;
  bool _finished2 = false;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  Widget _buildItem(int i) {
    return Cell(
      isLink: true,
      title: "$i",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List 列表"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: "基础用法"),
            Tab(text: "错误提示"),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          NList(
            finished: _finished1,
            finishedText: "没有更多了",
            child: List.generate(_dataList1.length, (i) => _buildItem(_dataList1[i])),
            onLoad: () {
              return Future.delayed(const Duration(milliseconds: 300), () {
                setState(() {
                  _dataList1
                      .addAll(List.generate(10, (i) => i + _dataList1.length));
                  _finished1 = _dataList1.length >= 40;
                });
              });
            },
          ),
          NList(
            finished: _finished2,
            finishedText: "没有更多了",
            error: _error,
            errorText: "请求失败，点击重新加载",
            child: List.generate(_dataList2.length, (i) => _buildItem(_dataList2[i])),
            onLoad: () {
              if (_dataList2.length != 0) {
                setState(() {
                  _error = _dataList2.length == 10 && !_error;
                });
              }
              if (!_error) {
                return Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() {
                    _dataList2.addAll(
                        List.generate(10, (i) => i + _dataList2.length));
                    _finished2 = _dataList2.length >= 30;
                  });
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
