import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/button.dart';


class demoButton extends StatefulWidget{
  @override
  _demoButton createState() => _demoButton();
}


class _demoButton extends State<demoButton>{
  bool _loading = false;
  Timer _timer;

  @override
  void initState() {
    super.initState();
  }

  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
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
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("默认按钮"),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              CustomButton(
                text: "按钮",
                color: Colors.white,
                textColor: Colors.black,
                onClick: () {},
              ),
              CustomButton(
                text: "按钮",
                color: Colors.blueAccent,
                onClick: () {},
              ),
              CustomButton(
                text: "按钮",
                color: Colors.green,
                onClick: () {},
              ),
              CustomButton(
                text: "按钮",
                color: Colors.redAccent,
                onClick: () {},
              ),
            ],
          ),
          Title("朴素按钮"),
          Wrap(
            spacing: 12,
            children: <Widget>[
              CustomButton(
                plain: true,
                text: "朴素按钮",
                color: Colors.blueAccent,
                onClick: () {},
              ),
              CustomButton(
                plain: true,
                text: "朴素按钮",
                color: Colors.green,
                onClick: () {},
              )
            ],
          ),
          Title("细边框"),
          Wrap(
            spacing: 12,
            children: <Widget>[
              CustomButton(
                plain: true, 
                hairline: true,
                text: "细边框按钮",
                color: Colors.blueAccent,
                onClick: () {},
              ),
              CustomButton(
                plain: true,
                hairline: true,
                text: "细边框按钮",
                color: Colors.green,
                onClick: () {},
              )
            ],
          ),
          Title("禁用状态"),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              CustomButton(
                disabled: true,
                text: "禁用状态",
                color: Colors.white,
                textColor: Colors.black,
              ),
              CustomButton(
                disabled: true,
                text: "禁用状态",
                color: Colors.green,
              ),
              CustomButton(
                plain: true,
                disabled: true,
                text: "禁用状态",
                color: Colors.blueAccent,
              )
            ],
          ),
          Title("加载状态"),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              CustomButton(
                loading: true,
                color: Colors.blueAccent,
              ),
              CustomButton(
                loading: true,
                text: "加载中...",
                color: Colors.green,
              ),
              CustomButton(
                plain: true,
                loading: _loading,
                text: "点击2S后恢复",
                color: Colors.blueAccent,
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
          Title("按钮形状"),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              CustomButton(
                text: "方形按钮",
                color: Colors.blueAccent,
                square: true,
                onClick: () {},
              ),
              CustomButton(
                text: "圆形按钮",
                color: Colors.blueAccent,
                round: true,
                onClick: () {},
              ),
              CustomButton(
                plain: true,
                text: "圆形按钮",
                color: Colors.blueAccent,
                round: true,
                onClick: () {},
              ),
              CustomButton(
                block: true,
                text: "块级按钮",
                color: Colors.blueAccent,
                onClick: () {},
              )
            ],
          ),
          SizedBox(height: 6),
          Title("图标边框"),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              CustomButton(
                color: Colors.blueAccent,
                size: "large",
                text: "大号按钮",
                onClick: () {},
              ),
              CustomButton(
                color: Colors.blueAccent,
                size: "normal",
                text: "普通按钮",
                onClick: () {},
              ),
              CustomButton(
                color: Colors.blueAccent,
                size: "small",
                text: "小型按钮",
                onClick: () {},
              ),
              CustomButton(
                color: Colors.blueAccent,
                size: "mini",
                text: "迷你按钮",
                onClick: () {},
              ),
            ],
          ),
          Title("图标边框"),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              CustomButton(
                icon: Icon(Icons.star_border, color: Colors.white, size: 18),
                color: Colors.blueAccent,
                onClick: () {},
              ),
              CustomButton(
                text: "按钮",
                icon: Icon(Icons.star_border, color: Colors.white, size: 18),
                color: Colors.blueAccent,
                onClick: () {},
              ),
              CustomButton(
                text: "按钮",
                plain: true,
                icon: SizedBox(
                  width: 18,
                  child: Image.network("https://img.yzcdn.cn/vant/logo.png"),
                ),
                color: Colors.blueAccent,
                onClick: () {},
              )
            ],
          ),
          Title("渐变色按钮"),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              CustomButton(
                text: "渐变色按钮",
                gradient: LinearGradient(colors: [Colors.lightBlue[300], Colors.blueAccent]),
                onClick: () {},
              ),
              CustomButton(
                text: "渐变色按钮",
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.greenAccent, Colors.redAccent]
                ),
                onClick: () {},
              ),
              CustomButton(
                text: "渐变色按钮",
                gradient: RadialGradient(
                  radius: 2,
                  colors: [Colors.lightBlue[300], Colors.blueAccent]
                ),
                onClick: () {},
              ),
            ],
          ),
          SizedBox(height: 20)
        ],
      )
    );
  }
}