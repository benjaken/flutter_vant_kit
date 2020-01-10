import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/badge.dart';
import 'package:flutter_vant_kit/widgets/button.dart';

class GoodsAction extends StatefulWidget {
  final List<ActionButtonItem> actions;
  final List<ButtonItem> buttons;

  GoodsAction({Key key, this.actions, this.buttons}) : super(key: key);

  @override
  _GoodsAction createState() => _GoodsAction();
}

class _GoodsAction extends State<GoodsAction> {
  GlobalKey _buttonsKey = GlobalKey();
  double buttonWidth;
  List<ActionButtonItem> _actions;
  List<ButtonItem> _buttons;

  @override
  void initState() {
    _actions = widget.actions ?? [];
    _buttons = widget.buttons ?? [];
    WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  _onLayoutDone(_) {
    RenderBox buttons = _buttonsKey.currentContext.findRenderObject();
    double buttonsWidth = buttons.size.width;
    setState(() {
      buttonWidth = (buttonsWidth - (Style.paddingSm * 2)) / _buttons.length;
    });
  }

  Widget buildButtons() {
    return Container(
      key: _buttonsKey,
      padding: Style.goodsActionButtonsPadding,
      color: Style.goodsActionBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(_buttons.length, (i) {
          ButtonItem button = _buttons[i];
          return NButton(
            borderRadius: _buttons.length == 1
                ? BorderRadius.circular(Style.borderRadiusMax)
                : i == 0
                    ? BorderRadius.horizontal(
                        left: Radius.circular(Style.borderRadiusMax))
                    : i == _buttons.length - 1
                        ? BorderRadius.horizontal(
                            right: Radius.circular(Style.borderRadiusMax))
                        : null,
            text: button.loading ? "" : button.customText ?? button.text,
            disabled: button.disabled,
            loading: button.loading,
            color: button.color ?? null,
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

  Widget buildActionButtonItem(i) {
    ActionButtonItem action = _actions[i];
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
            List.generate(_actions.length, (i) => buildActionButtonItem(i)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _actions.length > 0 ? buildAction() : Container(),
        Expanded(
          child: buildButtons(),
        )
      ],
    );
  }
}

class ActionButtonItem {
  final String text;
  final IconData icon;
  final String info;
  final Function() onClick;
  final Widget customIcon;
  final Widget customText;

  ActionButtonItem(
      {this.text,
      this.icon,
      this.info,
      this.onClick,
      this.customIcon,
      this.customText});
}

class ButtonItem {
  final String text;
  final dynamic color;
  final bool disabled;
  final bool loading;
  final Function() onClick;
  final Widget customText;

  ButtonItem(
      {this.text,
      this.color,
      this.disabled: false,
      this.loading: false,
      this.onClick,
      this.customText});
}
