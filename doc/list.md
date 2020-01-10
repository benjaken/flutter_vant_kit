## List 列表

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

NList(
  itemCount: _dataList.length,
  onLoadMore: _getDataList,
  itemBuilder: (context, i) {
    return _buildItem(i);
  }
)
```

更多例子请参考[Demo](../example/lib/routes/demoList.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| text | 标签内文字 | `String` | - |
| plain | 是否为空心样式 | `bool` | `false` |
| round | 是否为圆角样式 | `bool` | `false` |
| mark | 是否为标记样式 | `bool` | `false` |
| color | 标签颜色 | `Color` | `blueAccent` |
| textColor | 文字颜色，优先于color属性 | `Color` | - |
| onClose | 是否为可关闭标签 | `Function()` | - |
