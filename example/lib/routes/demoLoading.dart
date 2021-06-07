import 'package:example/generated/i18n.dart';
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
          title(I18n.of(context)!.basic_usage),
          Loading(),
          title(I18n.of(context)!.custom_color),
          Loading(
            color: Colors.blueAccent,
          ),
          title(I18n.of(context)!.load_text),
          Loading(
            color: Colors.blueAccent,
            text: I18n.of(context)!.loading,
          ),
          title(I18n.of(context)!.vertical_arrangement),
          Loading(
            color: Colors.blueAccent,
            text: I18n.of(context)!.loading,
            size: 20,
            vertical: true,
          ),
          title(I18n.of(context)!.custom_loading),
          Container(
            width: 100,
            child: Loading(
              loading: Image.network(
                  "https://loading.io/mod/spinner/lava-lamp/sample.gif"),
              text: I18n.of(context)!.loading,
            ),
          ),
          title(I18n.of(context)!.show_loading),
          NButton(
            text: I18n.of(context)!.show_loading,
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
                          text: I18n.of(context)!.loading,
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
