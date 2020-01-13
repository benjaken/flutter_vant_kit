## Avatar 头像

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

Avatar(
  type: 'large'
  ...
)
```

更多例子请参考[Demo](../example/lib/routes/demoAvatar.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| type | 头像类型，可选值为`large` `small` | `String` | `normal` |
| size | 头像大小，优先级比`type`的尺寸高 | `double` | - |
| shape | 头像形状，可选值为`square` | `String` | `round` |
| color | 头像背景颜色 | `Color` | `#ebedf0` |
| iconColor | 头像图标颜色 | `Color` | `#323233` |
| custom | 自定义图标内容 | `Widget` | - |
| image | 头像图片内容 | `ImageProvider` | - |
| onClick | 点击头像后回调 | `Function()` | - |
