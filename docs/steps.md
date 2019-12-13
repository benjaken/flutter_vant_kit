## Steps 步骤条

### 使用范例

```
import 'package:flutter_kit/widgets/steps.dart';

List<StepItem> steps = [
  StepItem("买家下单"),
  StepItem("商家接单"),
  StepItem("买家提货"),
  StepItem("交易完成"),
];

Steps(
  steps: steps,
  active: _active
),
```

更多例子请参考[Demo](../lib/routes/demoSteps.dart)

### API

#### Steps

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| steps | 所有步骤 | `List<StepItem>` | - |
| active | 当前步骤 | `int` | `0` |
| direction | 显示方向，可选值为`vertical` | `String` | `horizontal` |
| activeColor | 激活状态颜色 | `Color` | `blueAccent` |
| activeIcon | 激活状态图标 | `IconData` | `check_circle` |
| inactiveIcon | 未激活状态图标 | `IconData` | - |

#### StepItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| title | 步骤描述 | `String` | - |
| date | 步骤日期 | `String` | - |
