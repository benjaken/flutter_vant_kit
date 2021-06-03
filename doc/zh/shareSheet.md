## ShareSheet 分享面板

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

List<ShareSheetItem> options = [
  ShareSheetItem(name: "微信"),
  ...
];

ShareSheet(
  title: "立即分享给好友",
  options: options
  ...
).show(context);
```

更多例子请参考[Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoShareSheet.dart)

### API

#### ShareSheetItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| name | 分享渠道名称 | `String` | - |
| description | 分享选项描述 | `String` | - |
| icon | 分享图标 | `Widget` | - |

#### ShareSheet

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| options | 分享选项 | `List<ShareSheetItem>` | - |
| title | 顶部标题 | `String` | - |
| cancelText | 取消按钮文字 | `String` | - |
| description | 标题下方的辅助描述文字 | `String` | - |
| closeOnClickOverlay | 是否在点击遮罩层后关闭 | `bool` | `true` |
| wrap | 是否多行显示 | `bool` | `false` |
| wrapNumber | 多行显示每行的个数，仅在`wrap=true`生效 | `int` | `4` |
| onSelect | 点击分享选项时触发 | `Function(ShareSheetItem shareSheetItem, int index)` | - |
| onCancel | 点击取消按钮时触发 | `Function()` | - |
