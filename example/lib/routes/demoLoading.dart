import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoLoading extends StatefulWidget {
  @override
  _DemoLoading createState() => _DemoLoading();
}

class _DemoLoading extends State<DemoLoading> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
          Loading(),
          title("自定义颜色"),
          Loading(
            color: Colors.blueAccent,
          ),
          title("加载文案"),
          Loading(
            color: Colors.blueAccent,
            text: "加载中...",
          ),
          title("垂直排列"),
          Loading(
            color: Colors.blueAccent,
            text: "加载中...",
            size: 20,
            vertical: true,
          ),
          title("自定义 Loading"),
          Container(
            width: 100,
            child: Loading(
              loading: Image.network(
                  "https://loading.io/mod/spinner/lava-lamp/sample.gif"),
              text: "加载中...",
            ),
          ),
          title("显示Loading"),
          NButton(
            text: "显示loading",
            type: "primary",
            onClick: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.white),
                        padding: EdgeInsets.all(20),
                        child: Loading(
                          color: Colors.blueAccent,
                          text: "加载中...",
                        ),
                      ),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
