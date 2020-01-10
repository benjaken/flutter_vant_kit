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
          title("基础用法"),
          GoodsAction(
            actions: [
              ActionButtonItem(text: "客服", icon: Icons.chat_bubble_outline),
              ActionButtonItem(text: "购物车", icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                  text: "加入购物车",
                  color: LinearGradient(
                      colors: [Color(0xffffd01e), Color(0xffff8917)])),
              ButtonItem(
                  text: "立即购买",
                  color: LinearGradient(
                      colors: [Color(0xffff6034), Color(0xffee0a24)])),
            ],
          ),
          title("徽标提示"),
          GoodsAction(
            actions: [
              ActionButtonItem(text: "客服", icon: Icons.chat_bubble_outline),
              ActionButtonItem(
                  text: "购物车", icon: Icons.add_shopping_cart, info: "5"),
              ActionButtonItem(text: "店铺", icon: Icons.store, info: "12"),
            ],
            buttons: [
              ButtonItem(
                  text: "加入购物车",
                  color: LinearGradient(
                      colors: [Color(0xffffd01e), Color(0xffff8917)])),
              ButtonItem(
                  text: "立即购买",
                  color: LinearGradient(
                      colors: [Color(0xffff6034), Color(0xffee0a24)])),
            ],
          ),
          title("加载和禁止状态"),
          GoodsAction(
            actions: [
              ActionButtonItem(text: "客服", icon: Icons.chat_bubble_outline),
              ActionButtonItem(text: "购物车", icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                  text: "加入购物车",
                  disabled: true,
                  color: LinearGradient(
                      colors: [Color(0xffffd01e), Color(0xffff8917)])),
              ButtonItem(
                  text: "立即购买",
                  loading: true,
                  color: LinearGradient(
                      colors: [Color(0xffff6034), Color(0xffee0a24)])),
            ],
          ),
          title("自定义内容"),
          GoodsAction(
            actions: [
              ActionButtonItem(
                  customText: Text("客服",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 12)),
                  customIcon: Icon(Icons.chat_bubble_outline,
                      color: Colors.blueAccent, size: 16)),
              ActionButtonItem(text: "购物车", icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(text: "加入购物车", color: Color(0xffbe99ff)),
              ButtonItem(text: "立即购买", color: Color(0xff7232dd)),
            ],
          ),
        ],
      ),
    );
  }
}
