## Progress 进度条

### 使用范例

```
import 'package:flutter_kit/widgets/progress.dart';

Progress(
  percentage: 50,
  showPivot: true
  ...
)
```

更多例子请参考[Demo](../lib/routes/demoProgress.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| inactive | 是否置灰 | `bool` | `false` |
| percentage | 进度百分比 | `double` | `0` |
| strokeWidth | 进度条粗细 | `double` | `5` |
| showPivot | 是否显示进度条文字 | `bool` | `false` |
| color | 进度条颜色 | `Color` | `blueAccent` |
| textColor | 进度文字颜色 | `Color` | `white` |
| trackColor | 轨道颜色 | `Color` | `grey` |
| pivotText | 文字显示 | `String` | - |
| pivotColor | 文字背景色 | `Color` | - |
