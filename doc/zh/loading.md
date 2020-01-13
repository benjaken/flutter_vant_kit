## Loading 加载

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

Loading(
  color: Colors.blueAccent,
  ...
)
```

更多例子请参考[Demo](../example/lib/routes/demoLoading.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| text | 加载描述 | `String` | - |
| color | 加载环颜色 | `Color` | `#c9c9c9` |
| size | 加载环大小 | `double` | `30.0` |
| textSize | 加载描述字体大小 | `double` | `14.0` |
| vertical | 是否为垂直排列 | `bool` | `false` |
| loading | 自定义内容 | `Widget` | - |
