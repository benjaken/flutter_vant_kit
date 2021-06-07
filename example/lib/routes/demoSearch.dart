import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoSearch extends StatefulWidget {
  @override
  _DemoSearch createState() => _DemoSearch();
}

class _DemoSearch extends State<DemoSearch> {
  IconData _icon = Icons.star_border;
  Color _color = Colors.grey;

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
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
          Search(),
          title(I18n.of(context)!.event_monitor),
          Search(
            showAction: true,
            onSubmitted: (val) {
              Utils.toast("searching $val");
            },
            onCancel: () {
              Utils.toast("canceled");
            },
          ),
          title(I18n.of(context)!.custom_style),
          Search(
            shape: "round",
            background: Color(0xfff2f3DA),
            showAction: true,
            maxLength: 16,
            placeholder: I18n.of(context)!.placeholder_input,
          ),
          title(I18n.of(context)!.custom_button_text),
          Search(
            showAction: true,
            left: Row(
              children: <Widget>[
                Text(I18n.of(context)!.address),
                SizedBox(width: 6),
                GestureDetector(
                  child: Icon(_icon, color: _color, size: 18),
                  onTap: () {
                    setState(() {
                      _icon = Icons.star;
                      _color = Colors.orangeAccent;
                    });
                  },
                )
              ],
            ),
            rightIcon: Icons.search,
            onClickRight: () {
              Utils.toast("clicked Right Icon");
            },
            right: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Utils.toast("clicked Right");
                  },
                  child: Text(I18n.of(context)!.search),
                ),
                SizedBox(width: 4),
                Text(I18n.of(context)!.collect)
              ],
            ),
          )
        ]));
  }
}
