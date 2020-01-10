## ActionSheet 上拉菜单

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

List<ActionSheetItem> actionList = [
  ActionSheetItem(name: "选项"),
  ...
];

ActionSheet(
  actions: actionList
).show(context);
```

更多例子请参考[Demo](../example/lib/routes/demoActionSheet.dart)

### API

#### ActionSheetItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| name | 标题 | `String` | - |
| subname | 二级标题 | `String` | - |
| color | 选项文字颜色 | `Color` | `#323233` |
| loading | 是否为加载状态 | `bool` | `false` |
| disabled | 是否为禁用状态 | `bool` | `false` |

#### ActionSheet

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| actions | 菜单选项 | `List<ActionSheetItem>` | - |
| title | 顶部标题 | `String` | - |
| cancelText | 取消按钮文字 | `String` | - |
| description | 选项上方的描述信息 | `String` | - |
| round | 是否显示圆角 | `bool` | `true` |
| closeIcon | 关闭图标 | `IconData` | - |
| closeOnClickOverlay | 是否在点击遮罩层后关闭 | `bool` | `true` |
| onSelect | 选中选项时触发，禁用或加载状态下不会触发 | `Function(ActionSheetItem ActionSheetItem, int index)` | - |
| onCancel | 取消按钮点击时触发 | `Function()` | - |
| onClose | 关闭菜单时触发 | `Function()` | - |
| child | 自定义菜单内容 | `Widget` | - |
