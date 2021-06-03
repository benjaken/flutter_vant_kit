import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class ContactCard extends StatefulWidget {
  // 卡片类型，可选值为 edit
  final String type;
  // 联系人姓名
  final String? name;
  // 联系人手机号
  final String? tel;
  // 是否可编辑，当type=edit生效
  final bool editAble;
  // 点击时触发
  final Function()? onClick;
  ContactCard(
      {Key? key,
      this.type: 'add',
      this.name,
      this.tel,
      this.editAble: true,
      this.onClick})
      : super(key: key);
  _ContactCard createState() => _ContactCard();
}

class _ContactCard extends State<ContactCard> {
  Widget buildIcon() {
    return Padding(
      padding: Style.contactCardLeftIconPadding,
      child: widget.type == 'edit'
          ? Icon(Icons.person_outline,
              color: Style.contactCardLeftIconColor,
              size: Style.contactCardLeftIconSize)
          : Container(
              decoration: BoxDecoration(
                  color: Style.contactCardAddBackgroundColor,
                  borderRadius:
                      BorderRadius.circular(Style.couponBorderRadius)),
              padding: Style.contactCardAddPadding,
              child: Icon(Icons.add,
                  color: Style.contactCardAddColor,
                  size: Style.contactCardAddSize),
            ),
    );
  }

  Widget buildBorder() {
    double screenWidth = MediaQuery.of(context).size.width;
    int count = screenWidth ~/
        (Style.contactCardBorderItemWidth + Style.contactCardBorderItemSpace);
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (int index) {
        return SizedBox(
          width: Style.contactCardBorderItemWidth,
          height: Style.contactCardBorderItemHeight,
          child: DecoratedBox(
            decoration:
                BoxDecoration(color: index % 2 == 0 ? Style.blue : Style.red),
          ),
        );
      }),
    );
  }

  Widget buildContent() {
    return Container(
      padding: Style.contactCardPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              buildIcon(),
              widget.type == 'add'
                  ? Text('添加联系人',
                      style: TextStyle(
                          fontSize: Style.contactCardFontSize,
                          color: Style.contactCardTextColor))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.name != null
                            ? Text('姓名：' + (widget.name as String),
                                style: TextStyle(
                                    fontSize: Style.contactCardFontSize,
                                    color: Style.contactCardTextColor))
                            : Container(),
                        widget.tel != null
                            ? Text('电话：' + (widget.tel as String),
                                style: TextStyle(
                                    fontSize: Style.contactCardFontSize,
                                    color: Style.contactCardTextColor))
                            : Container()
                      ],
                    )
            ],
          ),
          widget.editAble
              ? Icon(Icons.chevron_right,
                  color: Style.contactCardIconColor,
                  size: Style.contactCardIconSize)
              : Container()
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Style.contactCardBackgroundColor),
      child: Column(
        children: [
          widget.editAble
              ? Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    child: buildContent(),
                    onTap: () {
                      if (widget.onClick != null) widget.onClick!();
                    },
                  ),
                )
              : buildContent(),
          buildBorder()
        ],
      ),
    );
  }
}
