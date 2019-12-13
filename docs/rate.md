## Rate 评分

### 使用范例

```
import 'package:flutter_kit/widgets/rate.dart';

Rate(
  icon: Icons.favorite,
  ...
)
```

更多例子请参考[Demo](../lib/routes/demoRate.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| count | 图标总数 | `int` | `5` |
| value | 当前分值 | `int` | - |
| size | 图标大小 | `double` | `24.0` |
| gutter | 图标间距 | `double` | `4.0` |
| icon | 自定义图标 | `IconData` | `star` |
| voidIcon | 自定义未选中图标 | `IconData` | `star_border` |
| color | 选中颜色 | `Color` | `orange` |
| voidColor | 未选中颜色 | `Color` | `grey` |
| readonly | 是否为只读状态 | `bool` | `false` |
| disabled | 是否为禁用状态 | `bool` | `false` |
| onChange | 当前分值变化时触发的事件 | `Function` | - |
