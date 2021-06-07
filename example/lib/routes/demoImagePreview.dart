import 'package:example/generated/i18n.dart';
import 'package:flutter/material.dart';
import '../utils/index.dart';
import 'package:flutter_vant_kit/main.dart';

class DemoImagePreview extends StatefulWidget {
  @override
  _DemoImagePreview createState() => _DemoImagePreview();
}

class _DemoImagePreview extends State<DemoImagePreview> {
  List<Widget> images = [
    Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-2.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-3.jpg"),
    Image.network("https://img.yzcdn.cn/vant/apple-4.jpg")
  ];

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
            children: <Widget>[
          title(I18n.of(context)!.basic_usage),
          Cell(
            title: I18n.of(context)!.preview_image,
            isLink: true,
            onClick: () {
              showImagePreview(
                context: context,
                images: images,
              );
            },
          ),
          title(I18n.of(context)!.incoming_configuration),
          CellGroup(
            border: false,
            children: [
              Cell(
                title: I18n.of(context)!.initial_position,
                isLink: true,
                onClick: () {
                  showImagePreview(
                      context: context,
                      images: images,
                      showIndicators: true,
                      startPosition: 2,
                      swipeDuration: Duration(seconds: 2),
                      onChange: (val) {
                        Utils.toast("Page Changed $val");
                      });
                },
              ),
              Cell(
                title: I18n.of(context)!.show_close_button,
                isLink: true,
                onClick: () {
                  showImagePreview(
                      context: context, images: images, closeable: true);
                },
              ),
              Cell(
                title: I18n.of(context)!.listen_close_events,
                isLink: true,
                onClick: () {
                  showImagePreview(
                      context: context,
                      images: images,
                      closeable: true,
                      onClose: (int index) {
                        Utils.toast(I18n.of(context)!
                            .close_in_image); // index.toString()
                      });
                },
              )
            ],
          )
        ]));
  }
}
