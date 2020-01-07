## Calendar 日历

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

DateTime selectedDate;

Calendar(
  defaultDate: selectedDate,
  ...
).show(context);
```

更多例子请参考[Demo](../example/lib/routes/demoCalendar.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| type | 选择类型，`single`表示选择单个日期，`range`表示选择日期区间 | `String` | `single` |
| title | 日历标题 | `String` | `日期选择` |
| color | 颜色，对底部按钮和选中日期生效 | `Color` | `blue` |
| minDate | 最小日期 | `DateTime` | - |
| maxDate | 最大日期 | `DateTime` | - |
| defaultDate | 默认选中的日期 | `DateTime` | - |
| rowHeight | 日期行高 | `double` | - |
| poppable | 是否以弹层的形式展示日历 | `bool` | `true` |
| round | 是否显示圆角弹窗 | `bool` | `true` |
| showMark | 是否显示月份背景水印 | `bool` | `true` |
| showConfirm | 是否展示确认按钮 | `bool` | `true` |
| closeOnClickOverlay | 是否在点击遮罩层后关闭 | `bool` | `true` |
| confirmText | 确认按钮的文字 | `String` | `确定` |
| height | 日程高度，当 `poppable=false` 时生效 | `double` | `400.0` |
| onSelect | 点击任意日期时触发 | `Function(DateTime date)` | - |
| onConfirm | 日期选择完成后触发，若`showConfirm=true`，则点击确认按钮后触发 | `Function(DateTime date)` | - |
