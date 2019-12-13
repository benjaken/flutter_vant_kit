import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  // 头像类型
  final String type;
  // 头像大小
  final double size;
  // 头像形状
  final String shape;
  // 头像背景颜色
  final Color color;
  // 头像图标颜色
  final Color iconColor;
  // 自定义图标内容
  final Widget custom;
  // 头像图片内容
  final ImageProvider image;
  // 点击头像后回调
  final Function onClick;

  Avatar({
    Key key,
    this.type: 'normal',
    this.size,
    this.shape: 'round',
    this.color,
    this.iconColor,
    this.custom,
    this.image,
    this.onClick
  }) : super(key: key);

  Map<String, double> defaultSize = {
    "small": 20,
    "normal": 24,
    "large": 28
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) onClick();
      },
      child: Container(
        width: size??defaultSize[type] * 1.5,
        height: size??defaultSize[type] * 1.5,
        decoration: BoxDecoration(
          color: color??Color(0xffebedf0),
          borderRadius: BorderRadius.circular(shape == 'square' ? 4 : 999)
        ),
        child: image != null ? CircleAvatar(
          backgroundImage: image,
        ) : Center(
          child: custom??Icon(Icons.perm_identity, color: iconColor??Colors.black, size: size??defaultSize[type]),
        ),
      ),
    );
  }
}