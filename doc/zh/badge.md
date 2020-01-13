## Badge 徽标

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

Badge(
  value: "10",
  child: ...,
),
```

更多例子请参考[Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoBadge.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| value | 角标内容 | `String` | - |
| dot | 红点 | `bool` | `false` |
| color | 自定义颜色 | `Color` | `#ee0a24` |
| textColor | 自定义文本颜色 | `Color` | `#ffffff` |
| textSize | 自定义文本大小 | `double` | `12.0` |
| child | 自定义徽标 | `Widget` | - |
