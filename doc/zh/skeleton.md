## Skeleton 骨架屏

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

Skeleton(
  row: 3,
  title: true,
  ...
)
```

更多例子请参考[Demo](../example/lib/routes/demoSkeleton.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| row | 段落占位图行数 | `int` | `0` |
| rowWidth | 段落占位图宽度 | `double` | `1` |
| title | 是否显示标题占位图 | `bool` | `false` |
| titleWidth | 标题占位图宽度 | `double` | `.4` |
| avatar | 是否显示头像占位图 | `bool` | `false` |
| avatarSize | 头像占位图大小 | `double` | `36` |
| avatarShape | 头像占位图形状，可选值为`round` | `String` | `suqare` |
| loading | 是否显示占位图 | `bool` | `false` |
| child | 不显示占位图时显示内容 | `Widget` | - |
