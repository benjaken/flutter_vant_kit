## SubmitBar 提交订单栏

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

SubmitBar(
  buttonText: "提交订单",
  price: 30.50,
  ...
)
```

更多例子请参考[Demo](../example/lib/routes/demoSubmitBar.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| price | 价格 | `double` | - |
| label | 价格左侧文案 | `String` | `合计：` |
| suffixLabel | 价格右侧文案 | `String` | - |
| textAlign | 价格文案对齐方向，可选值为`left` | `String` | `right` |
| buttonText | 按钮文字 | `String` | - |
| tip | 提示文案 | `String` | - |
| tipIcon | 左侧图标 | `IconData` | - |
| disabled | 是否禁用按钮 | `bool` | `false` |
| loading | 是否加载中 | `bool` | `false` |
| currency | 货币符号 | `String` | `¥` |
| decimalLength | 价格小数点后位数 | `int` | `2` |
| onSubmit | 按钮点击事件回调 | `Function()` | - |
| customTip | 提示文案中的额外操作和说明 | `Widget` | - |
| customTop | 自定义订单栏上方内容 | `Widget` | - |
| customLeft | 自定义订单栏左侧内容 | `Widget` | - |
