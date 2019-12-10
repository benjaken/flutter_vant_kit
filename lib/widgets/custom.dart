import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double horizontalPadding;
  final double verticalPadding;

  DefaultButton({
    Key key, @required this.onPressed, @required this.title, this.verticalPadding, this.horizontalPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding??24, vertical: verticalPadding??10),
      onPressed: onPressed,
      child: Text("$title"),
      color: Colors.white,
      highlightColor: Colors.grey[200],
      splashColor: Colors.grey[200],
      textColor: Colors.lightBlue
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double horizontalPadding;
  final double verticalPadding;

  PrimaryButton({
     Key key, @required this.onPressed, @required this.title, this.verticalPadding, this.horizontalPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding??24, vertical: verticalPadding??10),
      onPressed: onPressed,
      child: Text("$title"),
      color: Colors.blueAccent,
      highlightColor: Colors.lightBlue,
      splashColor: Colors.lightBlue,
      textColor: Colors.white
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;

  CustomIconButton({Key key, @required this.onPressed, @required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: icon,
        padding: EdgeInsets.all(0),
        color: Colors.black,
        highlightColor: Colors.white,
        splashColor: Colors.white,
        onPressed: onPressed);
  }
}

class MoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Icon icon;

  MoreButton(
      {Key key, @required this.onPressed, @required this.title, @required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: 80,
            height: 80,
            child: FlatButton(
              onPressed: onPressed,
              child: icon,
              color: Colors.white,
              highlightColor: Colors.grey[100],
              splashColor: Colors.grey[100],
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))
            )
          ),
          Text(title,
              style: TextStyle(color: Colors.grey, fontSize: 12))
        ],
      );
  }
}