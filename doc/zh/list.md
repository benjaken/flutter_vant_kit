## List 列表

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

List<int> _dataList1 = [];
bool _finished1 = false;

NList(
  finished: _finished1,
  finishedText: "没有更多了",
  child: List.generate(_dataList1.length, (i) => _buildItem(_dataList1[i])),
  onLoad: () {
    return Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _dataList1
            .addAll(List.generate(10, (i) => i + _dataList1.length));
        _finished1 = _dataList1.length >= 40;
      });
    });
  },
)
```

更多例子请参考[Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoList.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| finished | 是否已加载完成，加载完成后不再触发`onLoad`事件 | `bool` | `false` |
| error | 是否加载失败，加载失败后点击错误提示可以重新触发`onLoad`事件 | `bool` | `false` |
| offset | 滚动条与底部距离小于`offset`时触发`onLoad`事件 | `int` | `30` |
| loadingText | 加载过程中的提示文案 | `String` | `加载中...` |
| finishedText | 加载完成后的提示文案 | `String` | - |
| errorText | 加载失败后的提示文案 | `String` | - |
| child | 列表内内容 | `List<Widget>` | - |
| onLoad | 滚动条与底部距离小于`offset`时触发 | `Function()` | - |
