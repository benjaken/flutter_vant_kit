import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class NList extends StatefulWidget {
  bool finished;
  bool error;
  final int offset;
  final String loadingText;
  final String finishedText;
  final String errorText;
  final List<Widget> child;
  final Function() onLoad;

  NList(
      {Key key,
      this.child,
      this.finished: false,
      this.error: false,
      this.offset: 30,
      this.loadingText: "加载中...",
      this.finishedText,
      this.errorText,
      @required this.onLoad})
      : assert(onLoad != null, "onLoad must not be null"),
        super(key: key);

  @override
  _NList createState() => _NList();
}

class _NList extends State<NList> {
  ScrollController _controller = ScrollController();
  bool _loading = false;
  Timer timer;

  @override
  void initState() {
    super.initState();
    loadData();
    _controller..addListener(_scrollListener);
  }

  void _scrollListener() {
    double offset = _controller.offset;
    double maxScroll = _controller.position.maxScrollExtent;
    if (offset + widget.offset > maxScroll && (timer == null || !timer.isActive)) {
      timer = Timer(Duration(milliseconds: 100), () => loadData());
    }
    if (widget.finished) _controller.removeListener(_scrollListener);
  }

  void loadData() async {
    if (!widget.finished && !_loading) {
      setState(() {
        _loading = true;
      });
      await widget.onLoad();
      setState(() {
        _loading = false;
      });
      checkFullList();
    }
  }

  void checkFullList() {
    Future.delayed(Duration(milliseconds: 200), () {
      if (_controller.position.maxScrollExtent == 0 && !widget.error)
        loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    _controller.removeListener(_scrollListener);
  }

  Widget buildLoading() {
    return _loading
        ? Container(
            height: Style.listTextHeight,
            alignment: AlignmentDirectional.center,
            child: Loading(
              text: widget.loadingText,
              size: Style.listTextFontSize,
            ),
          )
        : Container();
  }

  Widget buildFinished() {
    return widget.finished && widget.finishedText != null
        ? Container(
            height: Style.listTextHeight,
            alignment: AlignmentDirectional.center,
            child: Text(
              "${widget.finishedText}",
              style: TextStyle(
                color: Style.listTextColor,
                fontSize: Style.listTextFontSize,
              ),
            ),
          )
        : Container();
  }

  Widget buildError() {
    return widget.error && widget.errorText != null
        ? GestureDetector(
            onTap: () {
              loadData();
            },
            child: Container(
              height: Style.listTextHeight,
              alignment: AlignmentDirectional.center,
              child: Text(
                "${widget.errorText}",
                style: TextStyle(
                  color: Style.listTextColor,
                  fontSize: Style.listTextFontSize,
                ),
              ),
            ))
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(controller: _controller, children: <Widget>[
        CellGroup(
          children: widget.child,
        ),
        buildLoading(),
        buildFinished(),
        buildError()
      ]),
    );
  }
}
