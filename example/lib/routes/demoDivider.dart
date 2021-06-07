import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoDivider extends StatefulWidget {
  @override
  _DemoDivider createState() => _DemoDivider();
}

class _DemoDivider extends State<DemoDivider> {
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
          title(I18n.of(context)!.basic_usage),
          NDivider(),
          title(I18n.of(context)!.display_text),
          NDivider(
            content: I18n.of(context)!.divider,
          ),
          title(I18n.of(context)!.content_position),
          NDivider(
            content: I18n.of(context)!.divider,
            contentPosition: 'left',
          ),
          SizedBox(height: 10),
          NDivider(
            content: I18n.of(context)!.divider,
            contentPosition: 'right',
          ),
          title(I18n.of(context)!.hairline_divider),
          NDivider(
            content: I18n.of(context)!.divider,
            hairline: true,
          ),
          title(I18n.of(context)!.custom_color),
          NDivider(
              lineColor: Colors.redAccent,
              fontColor: Colors.redAccent,
              content: I18n.of(context)!.no_more),
          SizedBox(height: 10),
          NDivider(
              lineColor: Colors.orangeAccent,
              fontColor: Colors.orangeAccent,
              content: I18n.of(context)!.no_more),
          SizedBox(height: 10),
          NDivider(
              lineColor: Colors.blueAccent,
              fontColor: Colors.blueAccent,
              content: I18n.of(context)!.no_more),
          title(I18n.of(context)!.custom_content),
          NDivider(child: Icon(Icons.cancel, color: Colors.blueAccent)),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
