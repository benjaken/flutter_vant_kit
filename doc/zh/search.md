## Search 搜索

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

 Search(
  showAction: true,
  ...
)
```

更多例子请参考[Demo](../example/lib/routes/demoSearch.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| shape | 搜索框形状，可选值为`round` | `String` | `square` |
| background | 搜索框背景色 | `Color` | `#f7f8fA` |
| maxLength | 输入的最大字符数 | `int` | `100` |
| placeholder | 占位提示文字 | `String` | `请输入搜索关键词` |
| clearable | 是否启用清除控件 | `bool` | `true` |
| showAction | 是否启用清除控件 | `bool` | `false` |
| actionText | 取消按钮文字 | `String` | `取消` |
| disabled | 是否禁用输入框 | `bool` | `false` |
| readonly | 是否将输入框设为只读 | `bool` | `false` |
| leftIcon | 输入框左侧图标 | `IconData` | `search` |
| rightIcon | 输入框右侧图标 | `IconData` | - |
| left | 自定义左侧内容 | `Widget` | - |
| right | 自定义右侧内容 | `Widget` | - |
| onClickLeft | 点击左侧内容反馈 | `Function()` | - |
| onClickRight | 点击右侧内容反馈 | `Function()` | - |
| onSubmitted | 点击提交按钮反馈 | `Function(String val)` | - |
| onCancel | 点击取消按钮反馈 | `Function()` | - |
