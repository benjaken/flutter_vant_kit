import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/Tag.dart';
import 'package:flutter_kit/widgets/price.dart';

class NCard extends StatelessWidget {
  // 左侧图片
  final Image image;
  // 标题
  final String title;
  // 描述
  final String desc;
  // 图片角标	
  final String tag;
  // 商品数量	
  final int num;
  // 商品价格	
  final double price;
  // 商品划线原价	
  final double originPrice;
  // 内容是否垂直居中	
  final bool centered;
  // 货币符号	
  final String currency;
  // 点击时触发	
  final Function onClick;

  final Widget customTitle;
  final Widget customDesc;
  final Widget customNum;
  final Widget customPrice;
  final Widget customOriginPrice;
  final Widget customThumb;
  final Widget customTag;
  final Widget customTags;
  final Widget customFooter;

  const NCard({
    Key key, 
    @required this.image,
    this.title,
    this.desc,
    this.tag,
    this.num,
    this.price,
    this.originPrice,
    this.centered: false,
    this.currency: "¥",
    this.onClick,
    this.customTitle,
    this.customDesc,
    this.customNum,
    this.customPrice,
    this.customOriginPrice,
    this.customThumb,
    this.customTag,
    this.customTags,
    this.customFooter
  }) : super(key: key);

  Widget buildThumb () {
    return Stack(
      children: <Widget>[
        customThumb??Container(
          width: 90,
          height: 90,
          margin: EdgeInsets.only(right: 6),
          child: image,
        ),
        customTag??(tag != null ? Positioned(
          left: 0,
          top: 0,
          child: Tag(
            color: Colors.red,
            mark: true,
            text: "$tag"
          ),
        ) : Container())
      ],
    );
  }

  Widget buildContent () {
    return Expanded(
      child: Container(
        height: 90,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: <Widget>[
                customTitle??Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                customDesc??Text(desc, maxLines: 1, style: TextStyle(fontSize: 12, color: Colors.grey)),
                SizedBox(height: 3),
                customTags??Container()
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      customPrice??Price(value: price, currency: currency),  
                      SizedBox(width: 6),
                      customOriginPrice??(originPrice != null ? Text("$currency${originPrice.toStringAsFixed(2)}", style: TextStyle(color: Colors.grey, fontSize: 12, decoration: TextDecoration.lineThrough)) : Container())
                    ],
                  ),
                  customNum??Text("x$num", style: TextStyle(fontSize: 12, color: Color(0xff969799)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) onClick();
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildThumb(),
                buildContent()
              ],
            ),
            customFooter??Container(),
          ],
        ),
      ),
    );
  }
}