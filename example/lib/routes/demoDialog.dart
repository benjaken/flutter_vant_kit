import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoDialog extends StatefulWidget {
  @override
  _DemoDialog createState() => _DemoDialog();
}

class _DemoDialog extends State<DemoDialog> {
  void _showDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return NDialog(
          title: '标题',
          message: "代码是写出来给人看的，附带能在机器上运行",
        );
      },
    );
  }

  void _showDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return NDialog(
          message: "代码是写出来给人看的，附带能在机器上运行",
        );
      },
    );
  }

  void _showDialog3(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return NDialog(
          title: "标题",
          message: "代码是写出来给人看的，附带能在机器上运行",
          showCancelButton: true,
        );
      },
    );
  }

  void _showDialog4(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return NDialog(
            title: "标题",
            message: "代码是写出来给人看的，附带能在机器上运行",
            showCancelButton: true,
            confirmButtonColor: Colors.blueAccent,
            confirmTextColor: Colors.white,
            confirmButtonText: "OK",
            cancelButtonColor: Colors.red,
            cancelTextColor: Colors.white,
            cancelButtonText: "CANCEL",
            titleAlign: AlignmentDirectional.centerStart,
            messageAlign: TextAlign.start);
      },
    );
  }

  void _showDialog5(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return NDialog(
          title: "标题",
          message: "代码是写出来给人看的，附带能在机器上运行",
          showCancelButton: true,
          beforeClose: () {
            return Future.delayed(Duration(seconds: 1), () {});
          },
        );
      },
    );
  }

  void _showDialog6(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return NDialog(
          title: "标题",
          child: Container(
            padding: EdgeInsets.all(24),
            child: Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
          ),
          showCancelButton: true,
          beforeClose: () {
            return Future.delayed(Duration(seconds: 1), () {});
          },
        );
      },
    );
  }

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
              NButton(
                text: "提示弹窗",
                type: "primary",
                onClick: () {
                  _showDialog1(context);
                },
              ),
              SizedBox(width: 10),
              NButton(
                text: "提示弹窗(无标题)",
                type: "primary",
                onClick: () {
                  _showDialog2(context);
                },
              ),
            ],
          ),
          title("确认弹窗"),
          Row(
            children: <Widget>[
              NButton(
                text: "确认弹窗",
                type: "primary",
                onClick: () {
                  _showDialog3(context);
                },
              ),
              SizedBox(width: 10),
              NButton(
                text: "自定义确认弹窗",
                type: "primary",
                onClick: () {
                  _showDialog4(context);
                },
              ),
            ],
          ),
          title("异步调用"),
          Row(
            children: <Widget>[
              NButton(
                text: "异步调用",
                type: "primary",
                onClick: () {
                  _showDialog5(context);
                },
              ),
            ],
          ),
          title("自定义内容"),
          Row(
            children: <Widget>[
              NButton(
                text: "自定义内容",
                type: "primary",
                onClick: () {
                  _showDialog6(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
