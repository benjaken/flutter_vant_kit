import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/list.dart';

class demoList extends StatefulWidget{
  @override
  _demoList createState() => _demoList();
}


class _demoList extends State<demoList> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<int> _dataList = [];
  bool _loading = true;

  Future<bool> _getDataList(int page) async {
    setState(() {
      _dataList.addAll(List.generate(20, (i) => i));
      _loading = false;
    });
    return _dataList.length < 40;
    // return records.length > 0;
  }

  @override
  void initState() {
    super.initState();
    _getDataList(1);
    _tabController = new TabController(vsync: this, length: 2);
  }

  Widget _buildItem(int i) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 2.0),
      child: ListTile(
        title: Text("${_dataList[i]}" ?? ''),
      ),
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
            itemCount: _dataList.length,
            onLoadMore: _getDataList,
            itemBuilder: (context, i) {
              return _buildItem(i);
            }
          ),
          Center(child: Text('船')),
        ],
      ),
    );
  }
}