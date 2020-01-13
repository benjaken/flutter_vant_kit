## List 列表

### Example

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

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoList.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| text | 标签内文字 | `String` | - |
| plain | 是否为空心样式 | `bool` | `false` |
| round | 是否为圆角样式 | `bool` | `false` |
| mark | 是否为标记样式 | `bool` | `false` |
| color | 标签颜色 | `Color` | `blueAccent` |
| textColor | 文字颜色，优先于color属性 | `Color` | - |
| onClose | 是否为可关闭标签 | `Function()` | - |
