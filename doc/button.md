## Button 按钮

### 使用范例

```
import 'package:flutter_vant_kit/widgets/button.dart';

NButton(
  text: "按钮",
  type: "primary",
  ...
),
```

更多例子请参考[Demo](../lib/routes/demoButton.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| type | 类型，可选值为`primary` `info` `danger` `warning` | `String` | `default` |
| size | 尺寸，可选值为`large` `small` `mini` | `String` | `normal` |
| text | 按钮文字 | `String` | - |
| width | 按钮宽度 | `double` | - |
| height | 按钮高度，优先级比`size`的高度高 | `double` | - |
| color | 按钮颜色，优先级比`type`的颜色高 | `Color` | `blueAccent` |
| icon | 左侧图标 | `Icon` | - |
| gradient | 渐变色设置，支持`LinearGradient` `RadialGradient`等，优先级比`color`高 | `Gradient` | - |
| textColor | 按钮文字颜色，优先级比`type`的颜色高 | `Color` | - |
| block | 是否为块级元素 | `bool` | `false` |
| plain | 是否为朴素按钮 | `bool` | `false` |
| square | 是否为方形按钮 | `bool` | `false` |
| round | 是否为圆形按钮 | `bool` | `false` |
| disabled | 是否禁用按钮 | `bool` | `false` |
| loading | 是否为加载中 | `bool` | `false` |
| hairline | 是否使用 0.5px 边框 | `bool` | `false` |
| padding | 自定义内边距，优先级比`size`的内边距高 | `EdgeInsets` | - |
| borderRadius | 自定义按钮圆角，优先级比`size`的圆角高 | `BorderRadius` | - |
| onClick | 点击按钮后回调 | `Function` | - |
