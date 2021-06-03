import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/divider.dart';

class ShareSheet {
  // 分享选项
  final List<ShareSheetItem> options;
  // 顶部标题
  final String? title;
  // 取消按钮文字，传入空字符串可以隐藏按钮
  final String? cancelText;
  // 标题下方的辅助描述文字
  final String? description;
  // 是否在点击遮罩层后关闭
  final bool closeOnClickOverlay;
  // 是否多行显示
  final bool? wrap;
  // 多行显示每行的个数，仅在wrap=true生效
  final int wrapNumber;
  // 点击分享选项时触发
  final Function(ShareSheetItem option, int index)? onSelect;
  // 取消按钮点击时触发
  final Function()? onCancel;
  const ShareSheet(
      {Key? key,
      required this.options,
      this.title,
      this.cancelText: '取消',
      this.description,
      this.wrap: false,
      this.wrapNumber: 4,
      this.closeOnClickOverlay: true,
      this.onSelect,
      this.onCancel});
  show(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isDismissible: closeOnClickOverlay,
        builder: (BuildContext context) {
          return _ShareSheet(this);
        });
  }
}

class _ShareSheet extends StatelessWidget {
  final ShareSheet shareSheet;

  const _ShareSheet(this.shareSheet);

  Widget buildTitle(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Style.shareSheetHeaderPadding,
      child: Column(children: [
        shareSheet.title != null
            ? Text(shareSheet.title!,
                style: TextStyle(
                    fontSize: Style.shareSheetHeaderFontSize,
                    fontWeight: Style.fontWeightBold))
            : Container(),
        SizedBox(height: Style.intervalSm),
        shareSheet.description != null
            ? Text(shareSheet.description!,
                style: TextStyle(
                    fontSize: Style.shareSheetDescriptionFontSize,
                    color: Style.shareSheetDescriptionColor))
            : Container(),
      ]),
    );
  }

  Widget buildCancelItem(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            height: Style.shareSheetCancelPaddingTop,
            color: Style.shareSheetCancelPaddingColor),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Style.shareSheetBackgroundColor,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              child: Container(
                alignment: AlignmentDirectional.center,
                height: Style.shareSheetCancelItemHeight,
                child: Text(shareSheet.cancelText!,
                    style: TextStyle(
                        fontSize: Style.shareSheetCancelItemFontSize,
                        color: Style.shareSheetCancelItemTextColor)),
              ),
              onTap: () {
                if (shareSheet.onCancel != null) shareSheet.onCancel!();
                close(context);
              },
            ),
          ),
        ),
        NDivider(hairline: true)
      ],
    );
  }

  void close(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget buildShare(BuildContext context) {
    int _row = 1;
    int optionsLength = shareSheet.options.length;
    num itemWidth = shareSheet.wrap!
        ? (MediaQuery.of(context).size.width - (Style.shareSheetPadding * 2)) ~/
            shareSheet.wrapNumber.toDouble()
        : Style.shareSheetItemSize;
    if (shareSheet.wrap!) {
      _row = optionsLength % shareSheet.wrapNumber == 0
          ? optionsLength ~/ shareSheet.wrapNumber
          : (optionsLength ~/ shareSheet.wrapNumber) + 1;
    }
    return _row > 1
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(_row, (index) {
              int start = index * shareSheet.wrapNumber.toInt();
              int end = (index + 1) * shareSheet.wrapNumber.toInt();
              end = end > optionsLength ? optionsLength : end;
              List<ShareSheetItem> items =
                  shareSheet.options.sublist(start, end);
              return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: index != _row - 1
                                    ? Style.borderWidthBase
                                    : 0,
                                color: Style.borderColor))),
                    padding: index != _row - 1
                        ? EdgeInsets.only(bottom: Style.shareSheetPadding)
                        : EdgeInsets.only(top: Style.shareSheetPadding),
                    child: buildShareItem(context, items, itemWidth),
                  ));
            }))
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: buildShareItem(context, shareSheet.options, itemWidth));
  }

  Widget buildShareItem(
      BuildContext context, List<ShareSheetItem> items, num? itemWidth) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          ShareSheetItem item = items[index];
          return GestureDetector(
            onTap: () {
              if (shareSheet.onSelect != null)
                shareSheet.onSelect!(item, index);
              return close(context);
            },
            child: Container(
              width: itemWidth!.toDouble(),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Style.gray2,
                        borderRadius: BorderRadius.all(
                            Radius.circular(Style.shareSheetItemIconSize / 2))),
                    width: Style.shareSheetItemIconSize,
                    height: Style.shareSheetItemIconSize,
                    margin: EdgeInsets.only(bottom: Style.intervalLg),
                    child: item.icon ??
                        Icon(
                          Icons.share,
                          size: Style.shareSheetItemIconSize / 2,
                          color: Style.shareSheetItemIconColor,
                        ),
                  ),
                  Text(item.name,
                      style: TextStyle(
                          fontSize: Style.shareSheetItemFontSize,
                          color: Style.shareSheetItemFontColor)),
                  item.description != null
                      ? Text(item.description!,
                          style: TextStyle(
                              fontSize: Style.shareSheetItemFontSize,
                              color: Style.shareSheetItemDescriptionFontColor))
                      : Container()
                ],
              ),
            ),
          );
        }));
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Style.shareSheetHeaderBorderRadius)),
            color: Style.shareSheetBackgroundColor),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            (shareSheet.title != null || shareSheet.description != null)
                ? buildTitle(context)
                : Container(),
            Container(
              padding: EdgeInsets.all(Style.shareSheetPadding),
              child: buildShare(context),
            ),
            (shareSheet.cancelText != null)
                ? buildCancelItem(context)
                : Container()
          ],
        )));
  }
}

class ShareSheetItem {
  final String name;
  final String? description;
  final Widget? icon;
  ShareSheetItem({required this.name, this.description, this.icon});
}
