import 'package:example/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoShareSheet extends StatefulWidget {
  @override
  _DemoShareSheet createState() => _DemoShareSheet();
}

class _DemoShareSheet extends State<DemoShareSheet> {
  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title("基础用法"),
        Cell(
          title: '显示分享面板',
          isLink: true,
          onClick: () {
            ShareSheet(
                title: "立即分享给好友",
                options: [
                  ShareSheetItem(
                      name: '微信',
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-wechat.png')),
                  ShareSheetItem(
                      name: '朋友圈',
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-wechat-moments.png')),
                  ShareSheetItem(
                      name: '微博',
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-weibo.png')),
                  ShareSheetItem(
                      name: 'QQ',
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-qq.png')),
                  ShareSheetItem(
                    name: '复制链接',
                    icon: Icon(
                      Icons.link,
                    ),
                  ),
                  ShareSheetItem(
                    name: '分享海报',
                    icon: Icon(
                      Icons.image,
                    ),
                  ),
                  ShareSheetItem(
                    name: '二维码',
                    icon: Icon(
                      Icons.qr_code,
                    ),
                  ),
                ],
                onSelect: (option, index) {
                  Utils.toast(option.name);
                }).show(context);
          },
        ),
        title("展示多行选项"),
        Cell(
          title: '显示分享面板',
          isLink: true,
          onClick: () {
            ShareSheet(title: "立即分享给好友", wrap: true, options: [
              ShareSheetItem(
                  name: '微信',
                  icon: Image.network(
                      'https://img01.yzcdn.cn/vant/share-sheet-wechat.png')),
              ShareSheetItem(
                  name: '朋友圈',
                  icon: Image.network(
                      'https://img01.yzcdn.cn/vant/share-sheet-wechat-moments.png')),
              ShareSheetItem(
                  name: '微博',
                  icon: Image.network(
                      'https://img01.yzcdn.cn/vant/share-sheet-weibo.png')),
              ShareSheetItem(
                  name: 'QQ',
                  icon: Image.network(
                      'https://img01.yzcdn.cn/vant/share-sheet-qq.png')),
              ShareSheetItem(
                name: '复制链接',
                icon: Icon(
                  Icons.link,
                ),
              ),
              ShareSheetItem(
                name: '分享海报',
                icon: Icon(
                  Icons.image,
                ),
              ),
              ShareSheetItem(
                name: '二维码',
                icon: Icon(
                  Icons.qr_code,
                ),
              ),
              // ShareSheetItem(name: '站内分享')
            ]).show(context);
          },
        ),
        title("自定义图标"),
        Cell(
          title: '显示分享面板',
          isLink: true,
          onClick: () {
            ShareSheet(title: "立即分享给好友", description: "描述信息", options: [
              ShareSheetItem(
                  name: '名称',
                  icon: Image.network(
                      'https://img01.yzcdn.cn/vant/custom-icon-fire.png')),
              ShareSheetItem(
                  name: '名称',
                  icon: Image.network(
                      'https://img01.yzcdn.cn/vant/custom-icon-light.png')),
              ShareSheetItem(
                  name: '名称',
                  icon: Image.network(
                      'https://img01.yzcdn.cn/vant/custom-icon-water.png'))
            ]).show(context);
          },
        ),
        title("展示描述信息"),
        Cell(
          title: '显示分享面板',
          isLink: true,
          onClick: () {
            ShareSheet(title: "立即分享给好友", description: "描述信息", options: [
              ShareSheetItem(
                  name: '微信',
                  icon: Image.network(
                      'https://img01.yzcdn.cn/vant/share-sheet-wechat.png')),
              ShareSheetItem(
                  name: '微博',
                  icon: Image.network(
                      'https://img01.yzcdn.cn/vant/share-sheet-weibo.png')),
              ShareSheetItem(
                  name: '复制链接',
                  icon: Icon(
                    Icons.link,
                  ),
                  description: '描述信息'),
              ShareSheetItem(
                name: '分享海报',
                icon: Icon(
                  Icons.image,
                ),
              ),
              ShareSheetItem(
                name: '二维码',
                icon: Icon(
                  Icons.qr_code,
                ),
              )
            ]).show(context);
          },
        ),
      ],
    ));
  }
}
