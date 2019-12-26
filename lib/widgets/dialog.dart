import 'package:flutter/material.dart';
import 'package:flutter_kit/theme/style.dart';

///自定义Dialog
class NDialog extends StatefulWidget {
  // 弹窗标题
  final String title;
  // 弹窗内容
  final String message;
  // 标题对齐方式
  final AlignmentDirectional titleAlign;
  // 内容对齐方式
  final TextAlign messageAlign;
  // 是否展示确认按钮
  final bool showConfirmButton;
  // 是否展示取消按钮
  final bool showCancelButton;
  // 确认按钮文案
  final String confirmButtonText;
  // 确认按钮颜色
  final Color confirmButtonColor;
  // 确认按钮文本颜色
  final Color confirmTextColor;
  // 取消按钮文案
  final String cancelButtonText;
  // 取消按钮颜色
  final Color cancelButtonColor;
  // 取消按钮文本颜色
  final Color cancelTextColor;
  // 是否在点击遮罩层后关闭弹窗
  final bool closeOnClickOverlay;
  // 点击确认按钮时触发
  final Function() onConfirm;
  // 点击取消按钮时触发
  final Function() onCancel;
  // 关闭前的回调函数
  final Function() beforeClose;
  // 自定义内容
  final Widget child;

  const NDialog(
      {Key key,
      this.title,
      @required this.message,
      this.titleAlign: AlignmentDirectional.center,
      this.messageAlign: TextAlign.center,
      this.showConfirmButton: true,
      this.showCancelButton: false,
      this.confirmButtonText: "确认",
      this.confirmButtonColor: Style.dialogBackgroundColor,
      this.confirmTextColor: Style.dialogConfirmButtonTextColor,
      this.cancelButtonText: "取消",
      this.cancelButtonColor: Style.dialogBackgroundColor,
      this.cancelTextColor: Style.dialogCancelButtonTextColor,
      this.closeOnClickOverlay: false,
      this.onConfirm,
      this.onCancel,
      this.beforeClose,
      this.child})
      : super(key: key);

  @override
  _NDialog createState() => _NDialog();
}

class _NDialog extends State<NDialog> {
  bool _confirmLoading = false;

  confirmDialog() async {
    if (widget.beforeClose != null) {
      setState(() {
        _confirmLoading = true;
      });
      await widget.beforeClose();
    }
    setState(() {
      _confirmLoading = false;
    });
    hideDialog();
    if (widget.onConfirm != null) {
      widget.onConfirm();
    }
  }

  hideDialog() async {
    if (widget.onCancel != null) {
      widget.onCancel();
    }
    Navigator.of(context).pop();
  }

  Widget buildCancelButton() {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: widget.cancelButtonColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Style.dialogBorderRadius))),
        child: Material(
            type: MaterialType.transparency,
            child: InkWell(
                onTap: hideDialog,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Style.dialogBorderRadius)),
                child: Container(
                    height: Style.dialogButtonHeight,
                    alignment: Alignment.center,
                    child: Text(widget.cancelButtonText,
                        style: TextStyle(
                          fontSize: Style.dialogFontSize,
                          color: widget.cancelTextColor,
                        ))))));
  }

  Widget buildConfirmButton() {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: widget.confirmButtonColor,
            borderRadius: widget.showCancelButton
                ? BorderRadius.only(
                    bottomRight: Radius.circular(Style.dialogBorderRadius))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(Style.dialogBorderRadius),
                    bottomRight: Radius.circular(Style.dialogBorderRadius))),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
              onTap: confirmDialog,
              focusColor: _confirmLoading
                    ? Style.transparent
                    : Theme.of(context).focusColor,
                highlightColor: _confirmLoading
                    ? Style.transparent
                    : Theme.of(context).highlightColor,
                hoverColor: _confirmLoading
                    ? Style.transparent
                    : Theme.of(context).hoverColor,
                splashColor: _confirmLoading
                    ? Style.transparent
                    : Theme.of(context).splashColor,
              borderRadius: widget.showCancelButton
                  ? BorderRadius.only(
                      bottomRight: Radius.circular(Style.dialogBorderRadius))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(Style.dialogBorderRadius),
                      bottomRight: Radius.circular(Style.dialogBorderRadius)),
              child: Container(
                height: Style.dialogButtonHeight,
                alignment: Alignment.center,
                child: _confirmLoading
                    ? SizedBox(
                        width: Style.dialogFontSize,
                        height: Style.dialogFontSize,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation(widget.confirmTextColor),
                          backgroundColor: widget.confirmButtonColor,
                          strokeWidth: 1,
                        ),
                      )
                    : Text(widget.confirmButtonText,
                        style: TextStyle(
                          fontSize: Style.dialogFontSize,
                          color: widget.confirmTextColor,
                        )),
              )),
        ));
  }

  Widget buildButtons() {
    return Container(
    child: Row(
      children: <Widget>[
        Expanded(
            child: widget.showCancelButton ? buildCancelButton() : Text(''),
            flex: widget.showCancelButton ? 1 : 0),
        SizedBox(
            width: widget.showCancelButton ? Style.borderWidthBase : 0,
            height: Style.dialogButtonHeight,
            child: Container(color: Style.borderColor)),
        Expanded(
            child:
                widget.showConfirmButton ? buildConfirmButton() : Container(),
            flex: widget.showConfirmButton ? 1 : 0),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    Column _buildContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: Style.dialogHeaderPadding,
          alignment: widget.titleAlign,
          child: Text(widget.title ?? "",
              style: TextStyle(
                  fontSize: Style.dialogFontSize,
                  color: Style.dialogTextColor,
                  fontWeight: Style.dialogHeaderFontWeight)),
        ),
        Flexible(
          child: widget.child ??
              Container(
                padding: EdgeInsets.fromLTRB(
                    Style.dialogMessagePadding,
                    widget.title != null
                        ? Style.dialogHasTitleMessagePaddingTop
                        : 0,
                    Style.dialogMessagePadding,
                    Style.dialogMessagePadding),
                child: Text(widget.message,
                    textAlign: widget.messageAlign,
                    style: TextStyle(
                        fontSize: Style.dialogMessageFontSize,
                        color: Style.dialogHasTitleMessageTextColor)),
              ),
        ),
        (widget.showConfirmButton || widget.showCancelButton)
            ? SizedBox(
                height: Style.borderWidthBase,
                child: Container(color: Style.borderColor))
            : Container(),
        (widget.showConfirmButton || widget.showCancelButton)
            ? buildButtons()
            : Container()
      ],
    );

    return WillPopScope(
      child: GestureDetector(
        onTap: () => {widget.closeOnClickOverlay ? hideDialog() : null},
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: width > 321
                      ? Style.dialogWidth
                      : Style.dialogSmallScreenWidth),
              child: Container(
                decoration: BoxDecoration(
                    color: Style.dialogBackgroundColor,
                    borderRadius:
                        BorderRadius.circular(Style.dialogBorderRadius)),
                child: _buildContent,
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        return widget.closeOnClickOverlay;
      });
  }
}
