import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoGoodsAction extends StatefulWidget {
  @override
  _DemoGoodsAction createState() => _DemoGoodsAction();
}

class _DemoGoodsAction extends State<DemoGoodsAction> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          title(I18n.of(context)!.basic_usage),
          GoodsAction(
            actions: [
              ActionButtonItem(
                  text: I18n.of(context)!.service,
                  icon: Icons.chat_bubble_outline),
              ActionButtonItem(
                  text: I18n.of(context)!.shopping_cart,
                  icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                  text: I18n.of(context)!.add_to_cart,
                  color: LinearGradient(
                      colors: [Color(0xffffd01e), Color(0xffff8917)])),
              ButtonItem(
                  text: I18n.of(context)!.buy_now,
                  color: LinearGradient(
                      colors: [Color(0xffff6034), Color(0xffee0a24)])),
            ],
          ),
          title(I18n.of(context)!.logo_hint),
          GoodsAction(
            actions: [
              ActionButtonItem(
                  text: I18n.of(context)!.service,
                  icon: Icons.chat_bubble_outline),
              ActionButtonItem(
                  text: I18n.of(context)!.shopping_cart,
                  icon: Icons.add_shopping_cart,
                  info: "5"),
              ActionButtonItem(
                  text: I18n.of(context)!.shop, icon: Icons.store, info: "12"),
            ],
            buttons: [
              ButtonItem(
                  text: I18n.of(context)!.add_to_cart,
                  color: LinearGradient(
                      colors: [Color(0xffffd01e), Color(0xffff8917)])),
              ButtonItem(
                  text: I18n.of(context)!.buy_now,
                  color: LinearGradient(
                      colors: [Color(0xffff6034), Color(0xffee0a24)])),
            ],
          ),
          title(I18n.of(context)!.load_and_disable_state),
          GoodsAction(
            actions: [
              ActionButtonItem(
                  text: I18n.of(context)!.service,
                  icon: Icons.chat_bubble_outline),
              ActionButtonItem(
                  text: I18n.of(context)!.shopping_cart,
                  icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                  text: I18n.of(context)!.add_to_cart,
                  disabled: true,
                  color: LinearGradient(
                      colors: [Color(0xffffd01e), Color(0xffff8917)])),
              ButtonItem(
                  text: I18n.of(context)!.buy_now,
                  loading: true,
                  color: LinearGradient(
                      colors: [Color(0xffff6034), Color(0xffee0a24)])),
            ],
          ),
          title(I18n.of(context)!.custom_content),
          GoodsAction(
            actions: [
              ActionButtonItem(
                  customText: Text(I18n.of(context)!.service,
                      style: TextStyle(color: Colors.blueAccent, fontSize: 12)),
                  customIcon: Icon(Icons.chat_bubble_outline,
                      color: Colors.blueAccent, size: 16)),
              ActionButtonItem(
                  text: I18n.of(context)!.shopping_cart,
                  icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                  text: I18n.of(context)!.add_to_cart,
                  color: Color(0xffbe99ff)),
              ButtonItem(
                  text: I18n.of(context)!.buy_now, color: Color(0xff7232dd)),
            ],
          ),
        ],
      ),
    );
  }
}
