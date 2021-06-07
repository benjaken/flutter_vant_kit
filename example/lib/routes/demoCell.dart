import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoCell extends StatefulWidget {
  @override
  _DemoCell createState() => _DemoCell();
}

class _DemoCell extends State<DemoCell> {
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
          CellGroup(children: <Widget>[
            Cell(
                title: I18n.of(context)!.cell_title,
                value: I18n.of(context)!.content),
            Cell(
                title: I18n.of(context)!.cell_title,
                value: I18n.of(context)!.content,
                label: I18n.of(context)!.description,
                require: true),
          ]),
          title(I18n.of(context)!.cell_size),
          CellGroup(children: <Widget>[
            Cell(
                title: I18n.of(context)!.cell_title,
                value: I18n.of(context)!.content,
                size: "large"),
            Cell(
                title: I18n.of(context)!.cell_title,
                value: I18n.of(context)!.content,
                size: "large",
                label: I18n.of(context)!.description),
          ]),
          title(I18n.of(context)!.show_icon),
          CellGroup(children: <Widget>[
            Cell(
                title: I18n.of(context)!.cell_title,
                value: I18n.of(context)!.content,
                icon: Icons.my_location),
          ]),
          title(I18n.of(context)!.only_value),
          CellGroup(children: <Widget>[
            Cell(value: I18n.of(context)!.content),
          ]),
          title(I18n.of(context)!.clickable),
          CellGroup(children: <Widget>[
            Cell(
              title: I18n.of(context)!.cell_title,
              isLink: true,
              onClick: () {
                Utils.toast(I18n.of(context)!.clicked);
              },
            ),
            Cell(
              title: I18n.of(context)!.cell_title,
              value: I18n.of(context)!.content,
              isLink: true,
              onClick: () {
                Utils.toast(I18n.of(context)!.clicked);
              },
            ),
            Cell(
              title: I18n.of(context)!.cell_title,
              value: I18n.of(context)!.content,
              label: I18n.of(context)!.description,
              arrowDirection: "down",
              isLink: true,
              onClick: () {
                Utils.toast(I18n.of(context)!.clicked);
              },
            ),
          ]),
          title(I18n.of(context)!.group_title),
          CellGroup(title: I18n.of(context)!.group1, children: <Widget>[
            Cell(
                title: I18n.of(context)!.cell_title,
                value: I18n.of(context)!.content),
          ]),
          CellGroup(title: I18n.of(context)!.group2, children: <Widget>[
            Cell(
                title: I18n.of(context)!.cell_title,
                value: I18n.of(context)!.content),
          ]),
          title(I18n.of(context)!.custom_slot),
          CellGroup(children: <Widget>[
            Cell(
              customTitle: Row(
                children: <Widget>[
                  Text(I18n.of(context)!.custom_title),
                  SizedBox(width: 4),
                  Tag(
                    text: I18n.of(context)!.tag,
                    color: Colors.blueAccent,
                  )
                ],
              ),
              value: I18n.of(context)!.content,
              isLink: true,
            ),
            Cell(
                title: I18n.of(context)!.cell_title,
                icon: Icons.store,
                customRight:
                    Icon(Icons.search, color: Colors.blueAccent, size: 16))
          ]),
          title(I18n.of(context)!.row_center),
          CellGroup(children: <Widget>[
            Cell(
                title: I18n.of(context)!.cell_title,
                value: I18n.of(context)!.content,
                label: I18n.of(context)!.description,
                center: true),
          ])
        ],
      ),
    );
  }
}
