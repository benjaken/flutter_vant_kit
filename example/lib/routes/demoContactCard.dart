import 'package:example/generated/i18n.dart';
import 'package:example/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoContactCard extends StatefulWidget {
  @override
  _DemoContactCard createState() => _DemoContactCard();
}

class _DemoContactCard extends State<DemoContactCard> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(I18n.of(context)!.add_contacts),
          ContactCard(
              type: 'add', onClick: () => {Utils.toast(I18n.of(context)!.add)}),
          title(I18n.of(context)!.add_contacts),
          ContactCard(
            type: 'edit',
            name: I18n.of(context)!.example_name,
            tel: '13000000000',
            onClick: () => {Utils.toast(I18n.of(context)!.edit)},
          ),
          title(I18n.of(context)!.disabled_edit),
          ContactCard(
              type: 'edit',
              name: I18n.of(context)!.example_name,
              tel: '13000000000',
              editAble: false)
        ],
      ),
    );
  }
}
