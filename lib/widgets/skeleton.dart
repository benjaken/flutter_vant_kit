import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Skeleton extends StatelessWidget {
  // 段落占位图行数
  final int row;
  // 段落占位图宽度
  final double rowWidth;
  // 是否显示标题占位图
  final bool title;
  // 标题占位图宽度
  final double titleWidth;
  // 是否显示头像占位图
  final bool avatar;
  // 头像占位图大小
  final double avatarSize;
  // 头像占位图形状
  final String avatarShape;
  // 是否显示占位图
  final bool loading;
  // 不显示占位图时显示内容
  final Widget child;

  const Skeleton(
      {Key key,
      this.row: 0,
      this.rowWidth: 1,
      this.title: false,
      this.titleWidth: .4,
      this.avatar: false,
      this.avatarSize: Style.skeletonAvatarSize,
      this.avatarShape: "suqare",
      this.loading: false,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildAvatar() {
      return avatar
          ? Container(
              width: avatarSize,
              height: avatarSize,
              margin: Style.skeletonAvatarMarginRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    avatarShape == 'round' ? Style.borderRadiusMax : 0),
                color: Style.skeletonAvatarBackgroundColor,
              ),
            )
          : Container();
    }

    Widget buildTitle() {
      return title
          ? FractionallySizedBox(
              widthFactor: titleWidth,
              child: Container(
                height: Style.skeletonTitleHeight,
                margin: Style.skeletonRowMarginBottom,
                color: Style.skeletonRowBackgroundColor
              ),
            )
          : Container();
    }

    List<Widget> buildRow() {
      List<Widget> widgets = [];
      for (int i = 0; i < row; i++) {
        widgets.add(FractionallySizedBox(
          widthFactor: i == row - 1 ? rowWidth / 2 : rowWidth,
          child: Container(
            height: Style.skeletonRowHeight,
            margin: Style.skeletonRowMarginBottom,
            color: Style.skeletonRowBackgroundColor
          ),
        ));
      }
      return widgets;
    }

    return child != null && !loading
        ? child
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              buildAvatar(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[buildTitle(), ...buildRow()],
                ),
              )
            ],
          );
  }
}
