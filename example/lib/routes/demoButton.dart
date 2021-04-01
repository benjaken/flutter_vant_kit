import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoButton extends StatefulWidget {
  @override
  _DemoButton createState() => _DemoButton();
}

class _DemoButton extends State<DemoButton> {
  bool _loading = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
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
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title("默认按钮"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  text: "默认按钮",
                  onClick: () {},
                ),
                NButton(
                  text: "主要按钮",
                  type: "primary",
                  onClick: () {},
                ),
                NButton(
                  text: "信息按钮",
                  type: "info",
                  onClick: () {},
                ),
                NButton(
                  text: "危险按钮",
                  type: "danger",
                  onClick: () {},
                ),
                NButton(
                  text: "警告按钮",
                  type: "warning",
                  onClick: () {},
                ),
              ],
            ),
            title("朴素按钮"),
            Wrap(
              spacing: 12,
              children: <Widget>[
                NButton(
                  plain: true,
                  text: "朴素按钮",
                  type: "primary",
                  onClick: () {},
                ),
                NButton(
                  plain: true,
                  text: "朴素按钮",
                  type: "info",
                  onClick: () {},
                )
              ],
            ),
            title("细边框"),
            Wrap(
              spacing: 12,
              children: <Widget>[
                NButton(
                  plain: true,
                  hairline: true,
                  text: "细边框按钮",
                  type: "primary",
                  onClick: () {},
                ),
                NButton(
                  plain: true,
                  hairline: true,
                  text: "细边框按钮",
                  type: "info",
                  onClick: () {},
                )
              ],
            ),
            title("禁用状态"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  disabled: true,
                  text: "禁用状态",
                ),
                NButton(
                  disabled: true,
                  text: "禁用状态",
                  type: "primary",
                ),
                NButton(
                  plain: true,
                  disabled: true,
                  text: "禁用状态",
                  type: "info",
                )
              ],
            ),
            title("加载状态"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  loading: true,
                  type: "primary",
                ),
                NButton(
                  loading: true,
                  text: "加载中...",
                  type: "primary",
                ),
                NButton(
                  plain: true,
                  loading: _loading,
                  text: "点击2S后恢复",
                  type: "info",
                  onClick: () {
                    setState(() {
                      _loading = true;
                    });
                    int count = 2;
                    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        if (count < 1) {
                          _timer.cancel();
                          _loading = false;
                        } else {
                          count -= 1;
                        }
                      });
                    });
                  },
                )
              ],
            ),
            title("按钮形状"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  text: "方形按钮",
                  type: "primary",
                  square: true,
                  onClick: () {},
                ),
                NButton(
                  text: "圆形按钮",
                  type: "info",
                  round: true,
                  onClick: () {},
                ),
                NButton(
                  plain: true,
                  text: "圆形按钮",
                  type: "primary",
                  round: true,
                  onClick: () {},
                ),
                NButton(
                  block: true,
                  text: "块级按钮",
                  type: "info",
                  onClick: () {},
                )
              ],
            ),
            title("图标边框"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  icon: Icon(Icons.star_border, color: Colors.white, size: 18),
                  type: "primary",
                  onClick: () {},
                ),
                NButton(
                  text: "按钮",
                  icon: Icon(Icons.star_border, color: Colors.white, size: 18),
                  type: "primary",
                  onClick: () {},
                ),
                NButton(
                  text: "按钮",
                  plain: true,
                  icon: SizedBox(
                    width: 18,
                    child: Image.network("https://img.yzcdn.cn/vant/logo.png"),
                  ),
                  type: "primary",
                  onClick: () {},
                )
              ],
            ),
            title("按钮尺寸"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                NButton(
                  type: "primary",
                  size: "large",
                  text: "大号按钮",
                  onClick: () {},
                ),
                NButton(
                  type: "primary",
                  size: "normal",
                  text: "普通按钮",
                  onClick: () {},
                ),
                NButton(
                  type: "primary",
                  size: "small",
                  text: "小型按钮",
                  onClick: () {},
                ),
                NButton(
                  type: "primary",
                  size: "mini",
                  text: "迷你按钮",
                  onClick: () {},
                ),
              ],
            ),
            title("自定义颜色"),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  text: "单色按钮",
                  color: Colors.purple,
                  onClick: () {},
                ),
                NButton(
                  text: "单色按钮",
                  color: Colors.purple,
                  plain: true,
                  onClick: () {},
                ),
                NButton(
                  text: "渐变色按钮",
                  color: LinearGradient(
                      colors: [Colors.lightBlue[300]!, Colors.blueAccent]),
                  onClick: () {},
                ),
                NButton(
                  text: "渐变色按钮",
                  color: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.greenAccent, Colors.redAccent]),
                  onClick: () {},
                ),
                NButton(
                  text: "渐变色按钮",
                  color: RadialGradient(
                      radius: 2,
                      colors: [Colors.lightBlue[300]!, Colors.blueAccent]),
                  onClick: () {},
                ),
              ],
            ),
            SizedBox(height: 20)
          ],
        ));
  }
}
