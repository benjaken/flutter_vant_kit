import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/cell.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class CollapseItem extends StatefulWidget {
  // 是否为展开状态
  bool isExpanded;
  // 唯一标识符，默认为索引值
  final String name;
  // 左侧图标
  final IconData icon;
  // 标题栏左侧内容	
  final String title;
  // 标题栏右侧内容	
  final String value;
  // 标题栏描述信息	
  final String label;
  // 自定义右侧图标
  final Icon rightIcon;
  // 是否可点击
  final bool clickable;
  // 自定义标题内容
  final Widget customTitle;
  // 自定义标题下方描述
  final Widget customLabel;
  // 面板内容
  final List<Widget> children;
  // 面板展开后回调
  final Function(bool val) onExpansionChanged;

  CollapseItem({
    Key key,
    this.title,
    this.name,
    this.icon,
    this.value,
    this.label, 
    this.rightIcon,
    this.clickable: true,
    this.isExpanded: false,
    this.customTitle,
    this.customLabel,
    this.children,
    this.onExpansionChanged,
  }) : super(key: key);

  @override
  _CollapseItem createState() => _CollapseItem();
}

class _CollapseItem extends State<CollapseItem> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0, end: 0.5);

  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    bool _isExpanded = PageStorage.of(context)?.readState(context)??widget.isExpanded;
    if (_isExpanded)
      _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (!widget.clickable) return;
    setState(() {
      widget.isExpanded = !widget.isExpanded;
    });
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse().then<void>((void value) {
        if (!mounted) return;
      });
    }
    PageStorage.of(context)?.writeState(context, widget.isExpanded);
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged(widget.isExpanded);
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse().then<void>((void value) {
        if (!mounted) return;
      });
    }
    PageStorage.of(context)?.writeState(context, widget.isExpanded);
    super.didUpdateWidget(oldWidget);
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Cell(
          customTitle: Row(
            children: <Widget>[
              Text(widget.title??"", style: TextStyle(color: widget.clickable ? Colors.black : Colors.grey)),
              widget.customTitle??Container()
            ],
          ),
          label: widget.label,
          customLabel: widget.customLabel,
          value: widget.value,
          icon: widget.icon,
          customRight: RotationTransition(
            turns: _iconTurns,
            child: widget.rightIcon??Icon(Icons.expand_more, color: widget.clickable ? Color(0xff969799) : Colors.grey),
          ),
          onClick: () {
            _handleTap();
          },
          clickable: widget.clickable
        ),
        ClipRect(
          child: Align(
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
      ],
    );
  }

  @override
  Widget build (BuildContext context) {
    return Container(
      color: Colors.white,
      child: AnimatedBuilder(
        animation: _controller.view,
        builder: _buildChildren,
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.fromLTRB(0, 15, 20, 15),
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Color(0xffebedf0))
            ),
          ),
          child: Column(
            children: widget.children
          ),
        )
      ),
    );
  }
}