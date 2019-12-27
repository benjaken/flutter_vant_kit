## NumberKeyboard 数字键盘

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

NumberKeyboard(
  title: "默认键盘",
  closeButtomText: "完成",
  ...
).show(context);
```

更多例子请参考[Demo](../example/lib/routes/demoNumberKeyboard.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| value | 当前输入值 | `String` | - |
| title | 键盘标题 | `String` | - |
| maxlength | 输入值最大长度 | `int` | - |
| extraKey | 左下角按键内容 | `String` | - |
| closeButtomText | 关闭按钮文字，空则不展示 | `String` | - |
| deleteButtonText | 删除按钮文字 | `String` | `删除` |
| showDeleteKey | 是否展示删除按钮 | `bool` | `true` |
| onChange | 当前输入值改变时触发 | `Function` | - |
| onSubmitted | 当前输入值等于最大值时触发 | `Function` | - |
| onClose | 键盘关闭时触发 | `Function` | - |
