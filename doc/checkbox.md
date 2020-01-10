## Checkbox 复选框

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

List<CheckItem> list = [
  CheckItem(name: "a", text: "复选框a"),
  CheckItem(name: "b", text: "复选框b"),
  ...
];

CheckboxGroup(
  list: list,
  ...
)
```

更多例子请参考[Demo](../example/lib/routes/demoCheckbox.dart)

### API

#### CheckGroup

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| list | 选项 | `List` | - |
| value | 所有选中项的标识符 | `List` | - |
| shape | 所有选项的形状 | `String` | `round` |
| max | 选项的最大可选数 | `int` | `9999` |
| inCellGroup | 是否为单元格组件 | `bool` | `false` |
| disabled | 是否禁用复选框 | `bool` | `false` |
| iconSize | 所有复选框的图标大小 | `double` | |
| checkedColor | 所有复选框的选中状态颜色 | `Color` | - |
| onChange | 当绑定值变化时触发的事件 | `Function(bool value)` | - |

#### CheckItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| name | 标识符 | `String` | - |
| value | 是否选中 | `bool` | `false` |
| shape | 选项的形状，可选值为`square` | `String` | `round` |
| text | 选项的描述 | `String` | - |
| disabled | 是否禁用复选框 | `bool` | `false` |
| iconSize | 图标大小 | `double` | `20` |
| checkedColor | 选中状态颜色 | `Color` | `#1989fa` |
