## GoodsAction 商品导航

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

GoodsAction(
  actions: [
    ActionButtonItem(text: "客服", icon: Icons.chat_bubble_outline),
    ...
  ],
  buttons: [
    ButtonItem(
      text: "加入购物车",
      gradient: LinearGradient(colors: [Color(0xffffd01e), Color(0xffff8917)])
    ),
    ...
  ],
)
```

更多例子请参考[Demo](../example/lib/routes/demoGoodsAction.dart)

### API

#### GoodsAction

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| actions | 左侧图标按钮 | `List<ActionButtonItem>` | - |
| buttons | 右侧按钮 | `List<ButtonItem>` | - |

#### ActionButtonItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| text | 按钮文字 | `String` | - |
| icon | 图标 | `IconData` | - |
| info | 图标右上角徽标的内容 | `String` | - |
| onClick | 点击后触发 | `Function` | - |
| customIcon | 自定义图标 | `Widget` | - |
| customText | 自定义文本 | `Widget` | - |

#### ButtonItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| text | 按钮文字 | `String` | - |
| gradient | 按钮渐变色 | `Gradient` | - |
| color | 按钮颜色 | `Color` | - |
| disabled | 是否禁用按钮 | `bool` | `false` |
| loading | 按钮是否加载中 | `bool` | `false` |
| onClick | 点击后触发 | `Function` | - |
| customText | 自定义文本 | `Widget` | - |
