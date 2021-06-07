import 'package:example/generated/i18n.dart';
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
        title(I18n.of(context)!.basic_usage),
        Cell(
          title: I18n.of(context)!.show_share_panel,
          isLink: true,
          onClick: () {
            ShareSheet(
                title: I18n.of(context)!.share_to_friend,
                options: [
                  ShareSheetItem(
                      name: I18n.of(context)!.wechat,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-wechat.png')),
                  ShareSheetItem(
                      name: I18n.of(context)!.wechat_group,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-wechat-moments.png')),
                  ShareSheetItem(
                      name: I18n.of(context)!.weibo,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-weibo.png')),
                  ShareSheetItem(
                      name: I18n.of(context)!.qq,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-qq.png')),
                  ShareSheetItem(
                    name: I18n.of(context)!.copy_link,
                    icon: Icon(
                      Icons.link,
                    ),
                  ),
                  ShareSheetItem(
                    name: I18n.of(context)!.share_paper,
                    icon: Icon(
                      Icons.image,
                    ),
                  ),
                  ShareSheetItem(
                    name: I18n.of(context)!.qrcode,
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
        title(I18n.of(context)!.show_multi_line_options),
        Cell(
          title: I18n.of(context)!.show_share_panel,
          isLink: true,
          onClick: () {
            ShareSheet(
                title: I18n.of(context)!.share_to_friend,
                wrap: true,
                options: [
                  ShareSheetItem(
                      name: I18n.of(context)!.wechat,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-wechat.png')),
                  ShareSheetItem(
                      name: I18n.of(context)!.wechat_group,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-wechat-moments.png')),
                  ShareSheetItem(
                      name: I18n.of(context)!.weibo,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-weibo.png')),
                  ShareSheetItem(
                      name: I18n.of(context)!.qq,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-qq.png')),
                  ShareSheetItem(
                    name: I18n.of(context)!.copy_link,
                    icon: Icon(
                      Icons.link,
                    ),
                  ),
                  ShareSheetItem(
                    name: I18n.of(context)!.share_paper,
                    icon: Icon(
                      Icons.image,
                    ),
                  ),
                  ShareSheetItem(
                    name: I18n.of(context)!.qrcode,
                    icon: Icon(
                      Icons.qr_code,
                    ),
                  ),
                ]).show(context);
          },
        ),
        title(I18n.of(context)!.custom_icon),
        Cell(
          title: I18n.of(context)!.show_share_panel,
          isLink: true,
          onClick: () {
            ShareSheet(
                title: I18n.of(context)!.share_to_friend,
                description: I18n.of(context)!.description,
                options: [
                  ShareSheetItem(
                      name: I18n.of(context)!.name,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/custom-icon-fire.png')),
                  ShareSheetItem(
                      name: I18n.of(context)!.name,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/custom-icon-light.png')),
                  ShareSheetItem(
                      name: I18n.of(context)!.name,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/custom-icon-water.png'))
                ]).show(context);
          },
        ),
        title(I18n.of(context)!.display_description),
        Cell(
          title: I18n.of(context)!.show_share_panel,
          isLink: true,
          onClick: () {
            ShareSheet(
                title: I18n.of(context)!.share_to_friend,
                description: I18n.of(context)!.description,
                options: [
                  ShareSheetItem(
                      name: I18n.of(context)!.wechat,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-wechat.png')),
                  ShareSheetItem(
                      name: I18n.of(context)!.wechat_group,
                      icon: Image.network(
                          'https://img01.yzcdn.cn/vant/share-sheet-wechat-moments.png')),
                  ShareSheetItem(
                    name: I18n.of(context)!.share_paper,
                    description: I18n.of(context)!.description,
                    icon: Icon(
                      Icons.image,
                    ),
                  ),
                  ShareSheetItem(
                    name: I18n.of(context)!.qrcode,
                    icon: Icon(
                      Icons.qr_code,
                    ),
                  ),
                ]).show(context);
          },
        ),
      ],
    ));
  }
}
