import 'package:flutter/material.dart';

typedef CallBack(int page);

class Pagination extends StatefulWidget {
  // 当前页码	
  int current;
  // 总记录数	
  final int totalItems;
  // 每页记录数	
  final int itemsPerPage;
  // 显示模式
  final String mode;
  // 上一页	
  final String prevText;
  // 下一页	
  final String nextText;
  // 显示的页码个数	
  final int showPageSize;
  // 页码改变时触发	
  final CallBack onChange;

  Pagination({
    Key key,
    this.current: 1,
    this.totalItems: 0,
    this.itemsPerPage: 10,
    this.mode: "multi",
    this.prevText: "上一页",
    this.nextText: "下一页",
    this.showPageSize: 5,
    this.onChange,
  }) : super(key: key);

  @override
  _Pagination createState () => _Pagination();
}

class _Pagination extends State<Pagination> {
  int pagesLength;
  List<int> pages = [];

  Widget buildItem (int index) {
    bool isFirstButton = index == 0;
    bool isLastButton = index == pagesLength + 1;
    String text = isFirstButton ? widget.prevText : isLastButton ? widget.nextText : "$index";
    bool isActive = index == widget.current;
    bool disabled = (isFirstButton && widget.current == 1) || (isLastButton && widget.current == pagesLength);
    bool isSimple = widget.mode == 'simple';
    return InkWell(
        child: Container(
          alignment: Alignment.center,
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: (isFirstButton || isLastButton) ? 20 : 10),
          child: Text(text, style: TextStyle(color: disabled ? Colors.grey : isActive ? Colors.white : Colors.blueAccent)),
          decoration: BoxDecoration(
            // borderRadius: isFirstButton ? BorderRadius.horizontal(left: Radius.circular(4.0)) : null,
            // : isLastButton ? BorderRadius.horizontal(right: Radius.circular(4.0)) : null,
            border: Border(
              top: BorderSide(color: isActive ? Colors.blueAccent : Color(0xffebedf0), width: 1),
              left: BorderSide(color: isActive ? Colors.blueAccent : Color(0xffebedf0), width: (isFirstButton || isLastButton && isSimple) ? 1 : 0.6),
              right: BorderSide(color: isActive ? Colors.blueAccent : Color(0xffebedf0), width: (isLastButton || isFirstButton && isSimple) ? 1 : 0.6),
              bottom: BorderSide(color: isActive ? Colors.blueAccent : Color(0xffebedf0), width: 1),
            ),
            color: isActive ? Colors.blueAccent : Colors.white
          ),
        ),
        onTap: () {
          if (disabled) return;
          if (isFirstButton) {
            setState(() {
              widget.current -= 1;
            });
          } else if (isLastButton) {
            setState(() {
              widget.current += 1;
            });
          } else {
            setState(() {
              widget.current = index;
            });
          }
          if (widget.onChange != null) widget.onChange(widget.current);
        },
      // ),
    );
  }

  Widget buildPages () {
    return Container(
      child: widget.mode == 'simple' ? Expanded( 
        child: Container(
          alignment: Alignment.center,
          child: Text("${widget.current}/${pagesLength}", style: TextStyle(color: Colors.grey)),
        ),
      ) : Row(
        children: List.generate(pagesLength > widget.showPageSize ? widget.showPageSize : pagesLength, (i) => buildItem(i + 1)),
      ),
    );
  }  

  @override
  Widget build(BuildContext context) {
    pagesLength = widget.totalItems ~/ widget.itemsPerPage;
    pagesLength = (widget.totalItems % widget.itemsPerPage) > 0 ? pagesLength + 1 : pagesLength;
    pagesLength = pagesLength == 0 ? 1 : pagesLength;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildItem(0),
        buildPages(),
        buildItem(pagesLength + 1)
      ],
    );
  }
}