import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';
import 'package:flutter_kit/widgets/badge.dart';
import 'package:flutter_kit/widgets/button.dart';

class GoodsAction extends StatefulWidget {
  List<ActionItem> actions;
  List<ButtonItem> buttons;

  GoodsAction({Key key, this.actions, this.buttons}) : super(key: key);

  @override
  _GoodsAction createState() => _GoodsAction();
}

class _GoodsAction extends State<GoodsAction> {
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
      buttonWidth =
          (buttonsWidth - (Style.paddingSm * 2)) / widget.buttons.length;
    });
  }

  Widget buildButtons() {
    return Container(
      key: _buttons,
      padding: Style.goodsActionButtonsPadding,
      color: Style.goodsActionBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(widget.buttons.length, (i) {
          ButtonItem button = widget.buttons[i];
          return NButton(
            borderRadius: widget.buttons.length == 1
                ? BorderRadius.circular(Style.borderRadiusMax)
                : i == 0
                    ? BorderRadius.horizontal(
                        left: Radius.circular(Style.borderRadiusMax))
                    : i == widget.buttons.length - 1
                        ? BorderRadius.horizontal(
                            right: Radius.circular(Style.borderRadiusMax))
                        : null,
            text: button.loading ? "" : button.customText ?? button.text,
            disabled: button.disabled,
            loading: button.loading,
            color: button.color ?? null,
            gradient: button.gradient ?? null,
            height: Style.goodsActionButtonHeight,
            width: buttonWidth,
            padding: EdgeInsets.all(0),
            onClick: () {
              if (button.disabled) return;
              if (button.onClick != null) button.onClick();
            },
          );
        }),
      ),
    );
  }

  Widget buildActionItem(i) {
    ActionItem action = widget.actions[i];
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            if (action.onClick != null) action.onClick();
          },
          child: Container(
            width: Style.goodsActionIconWidth,
            height: Style.goodsActionIconHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Badge(
                  value: action.info,
                  child: action.customIcon ??
                      Icon(action.icon,
                          size: Style.goodsActionIconSize,
                          color: Style.goodsActionIconColor),
                ),
                SizedBox(height: Style.intervalSm),
                action.customText ??
                    Text("${action.text}",
                        style: TextStyle(
                            fontSize: Style.goodsActionFontSize,
                            color: Style.goodsActionIconTextColor))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAction() {
    return Container(
      // padding: EdgeInsets.only(right: 10),
      color: Colors.white,
      child: Wrap(
        spacing: Style.intervalSm,
        children:
            List.generate(widget.actions.length, (i) => buildActionItem(i)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.actions = widget.actions ?? [];
    widget.buttons = widget.buttons ?? [];
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
  final Function() onClick;
  final Widget customIcon;
  final Widget customText;

  ActionItem(
      {this.text,
      this.icon,
      this.info,
      this.onClick,
      this.customIcon,
      this.customText});
}

class ButtonItem {
  final String text;
  final Gradient gradient;
  final Color color;
  final bool disabled;
  final bool loading;
  final Function() onClick;
  final Widget customText;

  ButtonItem(
      {this.text,
      this.gradient,
      this.color,
      this.disabled: false,
      this.loading: false,
      this.onClick,
      this.customText});
}
