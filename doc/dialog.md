## Dialog 弹窗

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

NDialog(
  title: '标题',
  ...
);
```

更多例子请参考[Demo](../example/lib/routes/demoDialog.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| title | 弹窗标题 | `String` | - |
| message | 弹窗内容 | `String` | - |
| titleAlign | 标题对齐方式 | `AlignmentDirectional` | `center` |
| messageAlign | 内容对齐方式 | `TextAlign` | `center` |
| showConfirmButton | 是否展示确认按钮 | `bool` | `true` |
| showCancelButton | 是否展示取消按钮 | `bool` | `false` |
| confirmButtonText | 确认按钮文案 | `String` | `确认` |
| confirmButtonColor | 确认按钮颜色 | `Color` | `#ffffff` |
| confirmTextColor | 确认按钮文本颜色 | `Color` | `#1989fa` |
| cancelButtonText | 取消按钮文案 | `String` | `取消` |
| cancelButtonColor | 取消按钮颜色 | `Color` | `#ffffff` |
| cancelTextColor | 取消按钮文本颜色 | `Color` | `#323233` |
| closeOnClickOverlay | 是否在点击遮罩层后关闭弹窗 | `bool` | `false` |
| onConfirm | 点击确认按钮时触发 | `Function()` | - |
| onCancel | 点击取消按钮时触发 | `Function()` | - |
| beforeClose | 关闭前的回调函数 | `Function()` | - |
| child | 自定义内容 | `Widget` | - |
