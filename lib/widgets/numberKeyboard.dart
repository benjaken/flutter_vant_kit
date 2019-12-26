import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class NumberKeyboard {
  // 当前输入值
  final String value;
  // 键盘标题
  final String title;
  // 输入值最大长度
  final int maxlength;
  // 左下角按键内容
  final String extraKey;
  // 关闭按钮文字，空则不展示
  final String closeButtomText;
  // 删除按钮文字
  final String deleteButtonText;
  // 是否展示删除按钮
  final bool showDeleteKey;
  // 当前输入值改变时触发
  final Function(String val) onChange;
  // 当前输入值等于最大值时触发
  final Function(String val) onSubmitted;
  // 键盘关闭时触发
  final Function() onClose;
  //TODO:增加点击空白区域关闭键盘
  // final bool hideOnClickOutside;
  //TODO:点击返回键时直接返回，

  NumberKeyboard(
      {this.value: "",
      this.title,
      this.maxlength,
      this.extraKey,
      this.closeButtomText,
      this.deleteButtonText: "删除",
      this.showDeleteKey: true,
      this.onChange,
      this.onSubmitted,
      this.onClose
      // this.hideOnClickOutside: true,
      });

  show(BuildContext context) {
    var _list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0];
    int length = value.length;
    List<String> _codeList = [...value.split("")];

    Widget buildTitle() {
      return (title != null || closeButtomText != null)
          ? Container(
              padding: Style.numberKeyboardTitlePadding,
              decoration: BoxDecoration(
                  color: Style.numberKeyboardBackgroundColor,
                  border: Border(
                      bottom: BorderSide(
                          width: Style.borderWidthBase,
                          color: Style.borderColor))),
              child: Row(
                mainAxisAlignment: closeButtomText != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: <Widget>[
                  title != null
                      ? Text(
                          title,
                          style: TextStyle(
                            fontSize: Style.numberKeyboardTitleFontSize,
                            color: Style.numberKeyboardTitleTextColor,
                          ),
                        )
                      : Container(),
                  closeButtomText != null
                      ? GestureDetector(
                          child: Text(closeButtomText,
                              style: TextStyle(
                                  fontSize: Style.numberKeyboardCloseFontSize,
                                  color: Style.numberKeyboardCloseColor)),
                          onTap: () {
                            Navigator.pop(context);
                            if (onClose != null) onClose();
                          },
                        )
                      : Container(),
                ],
              ),
            )
          : Container();
    }

    GridView buildKeyBoard() {
      return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.5,
            mainAxisSpacing: Style.numberKeyboardNumSpacing,
            crossAxisSpacing: Style.numberKeyboardNumSpacing,
          ),
          itemCount: 12,
          itemBuilder: (_, index) {
            return Material(
              color: (index == 9 || index == 11)
                  ? Style.numberKeyboardKeyBackground
                  : Colors.white,
              child: InkWell(
                child: Center(
                  child: index == 11
                      ? Text(showDeleteKey ? deleteButtonText : "",
                          style: TextStyle(
                              fontSize: Style.numberKeyboardDeleteFontSize))
                      : index == 9
                          ? Text(extraKey ?? "",
                              style: TextStyle(
                                  fontSize: Style.numberKeyboardDeleteFontSize))
                          : Text(_list[index].toString(),
                              style: TextStyle(
                                  fontSize: Style.numberKeyboardKeyFontSize)),
                ),
                onTap: () {
                  if (index == 9 && extraKey == null ||
                      index == 9 &&
                          extraKey != null &&
                          _codeList.contains(extraKey) ||
                      (index == 11 && !showDeleteKey)) return;
                  if (index == 11 && showDeleteKey) {
                    if (length == 0) return;
                    _codeList.removeLast();
                    length--;
                  } else {
                    if (maxlength != null && _codeList.length == maxlength)
                      return;
                    _codeList.add(index == 9 && extraKey != null
                        ? extraKey
                        : _list[index].toString());
                    length++;
                  }
                  String code = "";
                  for (int i = 0; i < _codeList.length; i++) {
                    code = code + _codeList[i].toString();
                  }
                  if (onChange != null) onChange(code);
                  if (maxlength != null &&
                      _codeList.length == maxlength &&
                      onSubmitted != null) {
                    onSubmitted(code);
                  }
                },
              ),
            );
          });
    }

    return showBottomSheet(
        context: context,
        backgroundColor: Style.numberKeyboardKeyBackground,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: Style.borderWidthBase,
                        color: Style.borderColor))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[buildTitle(), buildKeyBoard()],
            ),
          );
        });
  }
}
