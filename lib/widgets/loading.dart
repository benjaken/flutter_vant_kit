import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Loading extends StatelessWidget {
  // 加载描述
  final String? text;
  // 加载环颜色
  final Color? color;
  // 加载环大小
  final double size;
  // 加载描述字体大小
  final double textSize;
  // 加载条排列方式
  final bool vertical;
  // 自定义内容
  final Widget? loading;

  const Loading(
      {Key? key,
      this.text,
      this.color,
      this.size: Style.loadingSpinnerSize,
      this.textSize: Style.loadingTextFontSize,
      this.vertical: false,
      this.loading})
      : super(key: key);

  _buildLoading() {
    return SizedBox(
      width: size,
      height: size,
      child: loading ??
          CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation(color ?? Style.loadingSpinnerColor),
            backgroundColor: Style.transparent,
            strokeWidth: Style.loadingSpinnerWidth,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.transparent),
      child: vertical
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildLoading(),
                text != null
                    ? Padding(
                        padding: EdgeInsets.only(top: Style.intervalSm),
                        child: Text("$text",
                            style: TextStyle(
                                color: Style.loadingTextColor,
                                fontSize: textSize,
                                decoration: TextDecoration.none)),
                      )
                    : Container()
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildLoading(),
                text != null
                    ? Padding(
                        padding: EdgeInsets.only(left: Style.intervalXl),
                        child: Text("$text",
                            style: TextStyle(
                                color: Style.loadingTextColor,
                                fontSize: textSize,
                                decoration: TextDecoration.none)),
                      )
                    : Container()
              ],
            ),
    );
  }
}
