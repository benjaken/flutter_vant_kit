## Stepper 步进器

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

Steppers(
  step: 2,
  ...
)
```

更多例子请参考[Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoStepper.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| value | 当前值 | `double` | - |
| min | 最小值 | `double` | `0` |
| max | 最大值 | `double` | - |
| step | 步长，每次点击时改变的值 | `double` | `1` |
| disabled | 是否禁用步进器 | `bool` | `false` |
| disabledInput | 是否禁用输入框 | `bool` | `false` |
| size | 自定义大小 | `double` | `20.0` |
| inputWidth | 自定义 input 宽度 | `double` | - |
| showPlus | 是否显示增加按钮 | `bool` | `true` |
| showMinus | 是否显示减少按钮 | `bool` | `true` |
| decimalLength | 固定显示的小数位数 | `int` | `0` |
| onChange | 当前值变化时触发的事件 | `Function(String val)` | - |
