import 'package:flutter/material.dart';

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
  final Function onConfirm;
  // 点击取消按钮时触发	
  final Function onCancel;
  // 关闭前的回调函数
  final Function beforeClose;
  // 自定义内容
  final Widget child;

  const NDialog({
    Key key,
    this.title,
    this.message,
    this.titleAlign: AlignmentDirectional.center,
    this.messageAlign: TextAlign.center,
    this.showConfirmButton: true,
    this.showCancelButton: false,
    this.confirmButtonText: "确认",
    this.confirmButtonColor: Colors.white,
    this.confirmTextColor: Colors.blueAccent,
    this.cancelButtonText: "取消",
    this.cancelButtonColor: Colors.white,
    this.cancelTextColor: Colors.black,
    this.closeOnClickOverlay: false,
    this.onConfirm,
    this.onCancel,
    this.beforeClose,
    this.child
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    Column _buildContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        widget.title != null ? Container(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
          alignment: widget.titleAlign,
          child: Text(widget.title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
          ),
        ) : Container(),
        Flexible(
          child: widget.child??Container(
            padding: EdgeInsets.fromLTRB(24, widget.title != null ? 12 : 24, 24, 24),
            child: Text(widget.message,
              textAlign: widget.messageAlign,
              style: TextStyle(fontSize: 14.0, color: Color(0xff333333))
            ),
          ),
        ),
        (widget.showConfirmButton || widget.showCancelButton) ? SizedBox(height: 1.0, child: Container(color: Color(0xffebedf0))) : Container(),
        (widget.showConfirmButton || widget.showCancelButton) ? Container(
          height: 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: widget.showCancelButton ? Container(
                  decoration: BoxDecoration(
                    color: widget.cancelButtonColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))
                  ),
                  child: FlatButton(
                    child: Text(widget.cancelButtonText,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: widget.cancelTextColor,
                      )
                    ),
                    onPressed: hideDialog,
                    splashColor: widget.cancelButtonColor,
                    highlightColor: widget.cancelButtonColor,
                  ),
                ) : Text(''),
                flex: widget.showCancelButton ? 1 : 0
              ),
              SizedBox(
                width: widget.showCancelButton ? 1.0 : 0,
                child: Container(color: Color(0xffebedf0))
              ),
              Expanded(
                child: widget.showConfirmButton ? Container(
                  decoration: BoxDecoration(
                    color: widget.confirmButtonColor,
                    borderRadius: widget.showCancelButton
                      ? BorderRadius.only(bottomRight: Radius.circular(12.0))
                      : BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)
                        )
                      ),
                  child: FlatButton(
                    onPressed: confirmDialog,
                    child: _confirmLoading ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(widget.confirmTextColor),
                        backgroundColor: widget.confirmButtonColor,
                        strokeWidth: 1,
                      ),
                    ) : Text(
                      widget.confirmButtonText,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: widget.confirmTextColor,
                      )
                    ),
                    splashColor: widget.confirmButtonColor,
                    highlightColor: widget.confirmButtonColor,
                  ),
                ) : Container(),
                flex: widget.showConfirmButton ? 1 : 0),
            ],
          )
        ) : Container()
      ],
    );

    return WillPopScope(
        child: GestureDetector(
          onTap: () => {widget.closeOnClickOverlay ? hideDialog() : null},
          child: Material(
            type: MaterialType.transparency,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: width - 100.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12.0)
                  ),
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
