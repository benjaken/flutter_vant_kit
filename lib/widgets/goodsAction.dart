import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/badge.dart';
import 'package:flutter_kit/widgets/button.dart';

class GoodsAction extends StatefulWidget {
  List<ActionItem> actions;
  List<ButtonItem> buttons;

  GoodsAction({
    Key key,
    this.actions,
    this.buttons
  }) : super(key: key);  

  @override
  _GoodsAction createState() => _GoodsAction();
}

class _GoodsAction extends State<GoodsAction>{
  GlobalKey _buttons = GlobalKey();
  double buttonWidth;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  _onLayoutDone(_) {
    RenderBox buttons = _buttons.currentContext.findRenderObject();
    double buttonsWidth = buttons.size.width;
    setState(() {
      buttonWidth = (buttonsWidth - 20) / widget.buttons.length;
    });
  }
  
  Widget buildButtons () {
    return Container(
      key: _buttons,
      // alignment: AlignmentDirectional.centerEnd,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: Colors.white,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(widget.buttons.length, (i) {
          ButtonItem button = widget.buttons[i];
          return NButton(
            borderRadius: widget.buttons.length == 1 ? BorderRadius.circular(99.0) 
              : i == 0 ? BorderRadius.horizontal(left: Radius.circular(99)) : i == widget.buttons.length - 1 ? BorderRadius.horizontal(right: Radius.circular(99)) : null,
            text: button.loading ? "" : button.customText??button.text,
            disabled: button.disabled,
            loading: button.loading,
            color: button.color??null,
            gradient: button.gradient??null,
            height: 40,
            width: buttonWidth,
            onClick: () {
              if (button.disabled) return;
              if (button.onClick != null) button.onClick();
            },
          );
        }),
      ),
    );
  }

  Widget buildActionItem (i) {
    ActionItem action = widget.actions[i];
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            if (action.onClick != null) action.onClick();
          },
          child: Container(
            width: 46,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Badge(
                  value: action.info,
                  child: action.customIcon??Icon(action.icon, size: 16, color: Color(0xff323233)),
                ),
                SizedBox(height: 3),
                action.customText??Text("${action.text}", style: TextStyle(fontSize: 12, color: Color(0xff646566)))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAction () {
    return Container(
      // padding: EdgeInsets.only(right: 10),
      color: Colors.white,
      child: Wrap(
        spacing: 6,
        children: List.generate(widget.actions.length, (i) => buildActionItem(i)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.actions = widget.actions??[];
    widget.buttons = widget.buttons??[];
    return Row(
      children: <Widget>[
        widget.actions.length > 0 ? buildAction() : Container(),
        Expanded(
          child: buildButtons(),
        )
      ],
    );
  }
}

class ActionItem {
  final String text;
  final IconData icon;
  final String info;
  final Function onClick;
  final Widget customIcon;
  final Widget customText;

  ActionItem({this.text, this.icon, this.info, this.onClick,  this.customIcon, this.customText});
}

class ButtonItem {
  final String text;
  final Gradient gradient;
  final Color color;
  final bool disabled;
  final bool loading;
  final Function onClick;
  final Widget customText;

  ButtonItem({this.text, this.gradient, this.color, this.disabled: false, this.loading: false, this.onClick, this.customText});
}