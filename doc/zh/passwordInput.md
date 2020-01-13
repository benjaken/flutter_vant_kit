## PasswordInput 密码输入框

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

PasswordInput(
  value: _value,
  info: "密码为 6 位数字",
  ...
)
```

更多例子请参考[Demo](../example/lib/routes/demoPasswordInput.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| value | 密码值 | `String` | - |
| length | 密码最大长度 | `int` | `6` |
| mask | 是否隐藏密码内容 | `bool` | `true` |
| hideWhenSubmitted | 当密码值位数等于最大程度，是否自动隐藏键盘 | `bool` | `false` |
| info | 输入框下方文字提示 | `String` | - |
| onClick | 输入框点击时触发 | `Function()` | - |
| onChange | 密码值改变时触发 | `Function(String val)` | - |
| onSubmitted | 密码值位数等于最大程度时触发 | `Function(String val)` | - |
