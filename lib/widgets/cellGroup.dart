import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/divider.dart';

class CellGroup extends StatelessWidget {
  // 分组标题
  final String? title;
  // 是否显示外边框
  final bool border;
  // 自定义边框样式
  final BoxDecoration? decoration;
  // 默认插槽
  final List<Widget>? children;

  CellGroup(
      {Key? key, this.title, this.children, this.border: true, this.decoration})
      : super(key: key);

  buildItems(List list) {
    List<Widget> widgets = [];
    for (int i = 0; i < list.length; i++) {
      widgets.add(list[i]);
      if (i < list.length - 1)
        widgets.add(Container(
          margin: EdgeInsets.symmetric(horizontal: Style.cellHorizontalPadding),
          child: NDivider(),
        ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title != null
            ? Padding(
                padding: Style.cellGroupTitlePadding,
                child: Text(title!,
                    style: TextStyle(
                        fontSize: Style.cellGroupTitleFontSize,
                        color: Colors.grey)),
              )
            : Container(),
        Container(
          decoration: decoration ??
              BoxDecoration(
                  border: border
                      ? Border(
                          top: BorderSide(
                              width: Style.borderWidthBase,
                              color: Style.cellBorderColor),
                          bottom: BorderSide(
                              width: Style.borderWidthBase,
                              color: Style.cellBorderColor),
                        )
                      : null,
                  color: Colors.white),
          child: Column(
            children: buildItems(children!),
          ),
        )
      ],
    );
  }
}
