import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/theme/style.dart';

class Swipe extends StatefulWidget {
  //是否自动播放
  final bool autoPlay;
  // 自动轮播间隔
  final Duration interval;
  // 动画时长
  final Duration duration;
  // 初始位置索引值
  final int initialSwipe;
  // 是否显示指示器
  final bool showIndicators;
  //指示器大小
  final double indicatorSize;
  // 指示器颜色
  final Color indicatorColor;
  // 滚动方向
  final String scrollDirection;
  // 动画效果，默认fastOutSlowIn
  final Curve curve;
  // 每一页轮播后触发
  final Function(int val) onChange;
  // 每个页面在滚动方向占据的视窗比例，默认为 1
  final double viewportFraction;
  // 显示内容
  final List<Widget> children;
  // 自定义指示器
  final Widget indicator;

  final int _length;

  Swipe(
      {@required this.children,
      this.interval,
      this.autoPlay: false,
      this.initialSwipe: 0,
      this.indicatorSize: Style.swipeIndicatorSize,
      this.curve: Curves.fastOutSlowIn,
      this.duration,
      this.showIndicators: true,
      this.scrollDirection: 'horizontal',
      this.viewportFraction: 1.0,
      this.indicatorColor: Style.swipeIndicatorActiceBackgroundColor,
      this.onChange,
      this.indicator})
      : _length = children.length,
        assert(children.length > 0, 'children 数量必须大于零'),
        assert(viewportFraction > 0.0),
        assert((initialSwipe >= 0) && (initialSwipe < children.length),
            'initialSwipe 越界');

  @override
  _Swipe createState() => _Swipe();
}

class _Swipe extends State<Swipe> with SingleTickerProviderStateMixin {
  PageController _pageController;
  Timer timer;
  int _currentPage;
  int _realCurrentPage;

  @override
  void initState() {
    super.initState();
    //如果初始值是0，往左就滑不动了，所以给它赋一个大于零的值
    _currentPage = 100 * widget._length + widget.initialSwipe;

    _realCurrentPage = widget.initialSwipe;
    _pageController = PageController(
        initialPage: _currentPage, viewportFraction: widget.viewportFraction);

    if (widget.autoPlay) {
      Duration interval = widget.interval ?? Duration(seconds: 3);
      Duration duration = widget.duration ?? Style.swipeDuration;
      timer = Timer.periodic(interval, (Timer t) {
        int toPage = _currentPage = _currentPage + 1;
        setState(() {
          _currentPage = toPage;
        });
        _pageController.animateToPage(toPage,
            duration: duration, curve: widget.curve);
      });
    }
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: widget.scrollDirection == 'vertical'
            ? AlignmentDirectional.centerStart
            : AlignmentDirectional.center,
        children: <Widget>[
          Positioned.fill(
              child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: widget.scrollDirection == 'horizontal'
                      ? Axis.horizontal
                      : Axis.vertical,
                  itemBuilder: (context, i) {
                    int index = i % widget._length;
                    return widget.children[index];
                  },
                  onPageChanged: (i) {
                    setState(() {
                      _currentPage = i;
                      _realCurrentPage = i % widget._length;
                    });
                    if (widget.onChange != null)
                      widget.onChange((i) % 100 % widget._length + 1);
                  })),
          widget.showIndicators
              ? (widget.indicator != null
                  ? widget.indicator
                  : _buildIndicators())
              : Container()
        ],
      ),
    );
  }

  Widget _buildIndicators() {
    List<Widget> widgets = [];
    for (int i = 0; i < widget._length; i++) {
      Color color = _realCurrentPage == i
          ? widget.indicatorColor
          : Style.swipeIndicatorInacticeBackgroundColor
              .withOpacity(Style.swipeIndicatorInacticeOpacity);
      widgets.add(Container(
        margin: widget.scrollDirection == 'vertical'
            ? EdgeInsets.only(bottom: widget.indicatorSize)
            : EdgeInsets.only(right: widget.indicatorSize),
        width: widget.indicatorSize,
        height: widget.indicatorSize,
        decoration: ShapeDecoration(shape: StadiumBorder(), color: color),
      ));
    }
    return Positioned(
      left: widget.scrollDirection == 'vertical' ? 10.0 : null,
      bottom: widget.scrollDirection == 'horizontal' ? 10.0 : null,
      child: widget.scrollDirection == 'vertical'
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            ),
    );
  }
}
