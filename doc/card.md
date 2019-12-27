## Card 商品卡片

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

NCard(
  title: "商品名称",
  desc: "描述信息",
  ...
),
```

更多例子请参考[Demo](../example/lib/routes/demoCard.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| image | 左侧图片 | `Image` | - |
| title | 标题 | `String` | - |
| desc | 描述 | `String` | - |
| tag | 图片角标 | `String` | - |
| num | 商品数量 | `int` | - |
| price | 商品价格 | `double` | - |
| originPrice | 商品划线原价 | `double` | - |
| centered | 内容是否垂直居中 | `bool` | `false` |
| currency | 货币符号 | `String` | `¥` |
| onClick | 点击时触发 | `Function` | - |
| customTitle | 自定义标题内容 | `Widget` | - |
| customDesc | 自定义描述 | `Widget` | - |
| customNum | 自定义数量 | `Widget` | - |
| customPrice | 自定义价格 | `Widget` | - |
| customOriginPrice | 自定义商品原价 | `Widget` | - |
| customThumb | 自定义图片 | `Widget` | - |
| customTag | 自定义图片角标 | `Widget` | - |
| customTags | 自定义描述下方标签区域 | `Widget` | - |
| customFooter | 自定义 footer | `Widget` | - |
