## List

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<int> _dataList1 = [];
bool _finished1 = false;

NList(
  finished: _finished1,
  finishedText: "No more",
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

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoList.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| finished | Whether loading is finished，the `onLoad` event will not be triggered when finished | `bool` | `false` |
| error | Whether loading is error，the `onLoad` event will be triggered only when error text clicked | `bool` | `false` |
| offset | The `onLoad` event will be triggered when the distance between the scrollbar and the bottom is less than `offset` | `int` | `30` |
| loadingText | Loading text | `String` | `加载中...` |
| finishedText | Finished text | `String` | - |
| errorText | Error loaded text | `String` | - |
| child | List content | `List<Widget>` | - |
| onLoad | Triggered when the distance between the scrollbar and the bottom is less than `offset` | `Function()` | - |
