## Price 商品价格

### 使用范例

```
import 'package:flutter_kit/widgets/price.dart';

Price(
  value: 1234.567,
)
```

更多例子请参考[Demo](../lib/routes/demoPrice.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| value | 价格 | `double` | - |
| color | 价格颜色 | `Color` | `black` |
| size | 价格大小 | `double` | `20` |
| currency | 货币符号 | `String` | `¥` |
| decimal | 保留的小数点 | `int` | `2` |
| thousands | 是否按照千分号形式显示 | `bool` | `false` |
