import 'dart:async';

import 'package:example/generated/i18n.dart';
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
          title: I18n.of(context)!.title,
          message: I18n.of(context)!.example_content,
        );
      },
    );
  }

  void _showDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return NDialog(
          message: I18n.of(context)!.example_content,
        );
      },
    );
  }

  void _showDialog3(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return NDialog(
          title: I18n.of(context)!.title,
          message: I18n.of(context)!.example_content,
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
            title: I18n.of(context)!.title,
            message: I18n.of(context)!.example_content,
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
          title: I18n.of(context)!.title,
          message: I18n.of(context)!.example_content,
          showCancelButton: true,
          beforeClose: () {
            return Future.delayed(Duration(seconds: 1), () {
              return true;
            });
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
          title: I18n.of(context)!.title,
          child: Container(
            padding: EdgeInsets.all(24),
            child: Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
          ),
          showCancelButton: true,
          beforeClose: () {
            return Future.delayed(
                Duration(seconds: 1), () {} as FutureOr<bool> Function()?);
          },
        );
      },
    );
  }

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
          CellGroup(
            children: [
              Cell(
                title: I18n.of(context)!.tip_dialog,
                isLink: true,
                onClick: () {
                  _showDialog1(context);
                },
              ),
              Cell(
                title: I18n.of(context)!.tip_dialog_no_title,
                isLink: true,
                onClick: () {
                  _showDialog2(context);
                },
              ),
              Cell(
                title: I18n.of(context)!.confirm_dialog,
                isLink: true,
                onClick: () {
                  _showDialog3(context);
                },
              ),
            ],
          ),
          title(I18n.of(context)!.async_call),
          Cell(
            title: I18n.of(context)!.async_call,
            isLink: true,
            onClick: () {
              _showDialog5(context);
            },
          ),
          title(I18n.of(context)!.custom_confirm_dialog),
          Cell(
            title: I18n.of(context)!.custom_confirm_dialog,
            isLink: true,
            onClick: () {
              _showDialog4(context);
            },
          ),
          title(I18n.of(context)!.custom_content),
          Cell(
            title: I18n.of(context)!.custom_content,
            isLink: true,
            onClick: () {
              _showDialog6(context);
            },
          ),
        ],
      ),
    );
  }
}
