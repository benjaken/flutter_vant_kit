import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final double textSize;
  final bool vertical;
  final Widget loading;

  const Loading({
    Key key,
    this.text,
    this.color,
    this.size: 30,
    this.textSize: 14,
    this.vertical: false,
    this.loading
  }) : super(key: key);

  _buildLoading () {
    return SizedBox(
      width: size,
      height: size,
      child: loading??CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Color(0xffebedf0)),
        backgroundColor: color??Color(0xffc9c9c9),
        strokeWidth: 2,
      ),
    );
  }

  @override
  Widget build (BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.transparent
      ),
      child: vertical ? Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildLoading(),
          text != null ? Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text("$text", style: TextStyle(color: Colors.grey, fontSize: textSize)),
          ) : Container()
        ],
      ) : Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildLoading(),
          text != null ? Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text("$text", style: TextStyle(color: Colors.grey, fontSize: textSize)),
          ) : Container()
        ],
      ),
    );
  }
}