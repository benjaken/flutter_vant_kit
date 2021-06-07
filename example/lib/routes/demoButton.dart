import 'dart:async';

import 'package:example/generated/i18n.dart';
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
            title(I18n.of(context)!.default_button),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  text: I18n.of(context)!.default_button,
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.primary_button,
                  type: "primary",
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.info_button,
                  type: "info",
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.danger_button,
                  type: "danger",
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.warning_button,
                  type: "warning",
                  onClick: () {},
                ),
              ],
            ),
            title(I18n.of(context)!.plain_button),
            Wrap(
              spacing: 12,
              children: <Widget>[
                NButton(
                  plain: true,
                  text: I18n.of(context)!.plain_button,
                  type: "primary",
                  onClick: () {},
                ),
                NButton(
                  plain: true,
                  text: I18n.of(context)!.plain_button,
                  type: "info",
                  onClick: () {},
                )
              ],
            ),
            title(I18n.of(context)!.hairline_button),
            Wrap(
              spacing: 12,
              children: <Widget>[
                NButton(
                  plain: true,
                  hairline: true,
                  text: I18n.of(context)!.hairline_button,
                  type: "primary",
                  onClick: () {},
                ),
                NButton(
                  plain: true,
                  hairline: true,
                  text: I18n.of(context)!.hairline_button,
                  type: "info",
                  onClick: () {},
                )
              ],
            ),
            title(I18n.of(context)!.disabled_button),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  disabled: true,
                  text: I18n.of(context)!.disabled_button,
                ),
                NButton(
                  disabled: true,
                  text: I18n.of(context)!.disabled_button,
                  type: "primary",
                ),
                NButton(
                  plain: true,
                  disabled: true,
                  text: I18n.of(context)!.disabled_button,
                  type: "info",
                )
              ],
            ),
            title(I18n.of(context)!.loading_status),
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
                  text: I18n.of(context)!.loading,
                  type: "primary",
                ),
                NButton(
                  plain: true,
                  loading: _loading,
                  text: I18n.of(context)!.click_after_2_second,
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
            title(I18n.of(context)!.button_shape),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  text: I18n.of(context)!.square_button,
                  type: "primary",
                  square: true,
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.round_button,
                  type: "info",
                  round: true,
                  onClick: () {},
                ),
                NButton(
                  plain: true,
                  text: I18n.of(context)!.round_button,
                  type: "primary",
                  round: true,
                  onClick: () {},
                ),
                NButton(
                  block: true,
                  text: I18n.of(context)!.block_button,
                  type: "info",
                  onClick: () {},
                )
              ],
            ),
            title(I18n.of(context)!.icon),
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
                  text: I18n.of(context)!.button,
                  icon: Icon(Icons.star_border, color: Colors.white, size: 18),
                  type: "primary",
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.button,
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
            title(I18n.of(context)!.button_size),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                NButton(
                  type: "primary",
                  size: "large",
                  text: I18n.of(context)!.large_button,
                  onClick: () {},
                ),
                NButton(
                  type: "primary",
                  size: "normal",
                  text: I18n.of(context)!.normal_button,
                  onClick: () {},
                ),
                NButton(
                  type: "primary",
                  size: "small",
                  text: I18n.of(context)!.small_button,
                  onClick: () {},
                ),
                NButton(
                  type: "primary",
                  size: "mini",
                  text: I18n.of(context)!.mini_button,
                  onClick: () {},
                ),
              ],
            ),
            title(I18n.of(context)!.custom_color),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: <Widget>[
                NButton(
                  text: I18n.of(context)!.pure_button,
                  color: Colors.purple,
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.pure_button,
                  color: Colors.purple,
                  plain: true,
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.gradient_button,
                  color: LinearGradient(
                      colors: [Colors.lightBlue[300]!, Colors.blueAccent]),
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.gradient_button,
                  color: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.greenAccent, Colors.redAccent]),
                  onClick: () {},
                ),
                NButton(
                  text: I18n.of(context)!.gradient_button,
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
