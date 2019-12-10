import 'package:flutter/material.dart';

import 'package:flutter_kit/widgets/goodsAction.dart';

class demoGoodsAction extends StatefulWidget {
  @override
  _demoGoodsAction createState() => _demoGoodsAction();
}

class _demoGoodsAction extends State<demoGoodsAction> {
  Widget Title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Text(
        title, 
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Title("基础用法"),
          GoodsAction(
            actions: [
              ActionItem(text: "客服", icon: Icons.chat_bubble_outline),
              ActionItem(text: "购物车", icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                text: "加入购物车",
                gradient: LinearGradient(colors: [Color(0xffffd01e), Color(0xffff8917)])
              ),
              ButtonItem(
                text: "立即购买",
                gradient: LinearGradient(colors: [Color(0xffff6034), Color(0xffee0a24)])
              ),
            ],
          ),
          Title("徽标提示"),
          GoodsAction(
            actions: [
              ActionItem(text: "客服", icon: Icons.chat_bubble_outline),
              ActionItem(text: "购物车", icon: Icons.add_shopping_cart, info: "5"),
              ActionItem(text: "店铺", icon: Icons.store, info: "12"),
            ],
            buttons: [
              ButtonItem(
                text: "加入购物车",
                gradient: LinearGradient(colors: [Color(0xffffd01e), Color(0xffff8917)])
              ),
              ButtonItem(
                text: "立即购买",
                gradient: LinearGradient(colors: [Color(0xffff6034), Color(0xffee0a24)])
              ),
            ],
          ),
          Title("加载和禁止状态"),
          GoodsAction(
            actions: [
              ActionItem(text: "客服", icon: Icons.chat_bubble_outline),
              ActionItem(text: "购物车", icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                text: "加入购物车",
                disabled: true,
                gradient: LinearGradient(colors: [Color(0xffffd01e), Color(0xffff8917)])
              ),
              ButtonItem(
                text: "立即购买",
                loading: true,
                gradient: LinearGradient(colors: [Color(0xffff6034), Color(0xffee0a24)])
              ),
            ],
          ),
          Title("自定义内容"),
          GoodsAction(
            actions: [
              ActionItem(
                customText: Text("客服", style: TextStyle(color: Colors.blueAccent, fontSize: 12)),
                customIcon: Icon(Icons.chat_bubble_outline, color: Colors.blueAccent, size: 16)
              ),
              ActionItem(text: "购物车", icon: Icons.add_shopping_cart),
            ],
            buttons: [
              ButtonItem(
                text: "加入购物车",
                color: Color(0xffbe99ff)
              ),
              ButtonItem(
                text: "立即购买",
                color: Color(0xff7232dd)
              ),
            ],
          ),
        ],
      ),
    );
  }
}