## Radio 单选框

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

List<RadioItem> list = [
  RadioItem(name: "a", text: "单选框1"),
  RadioItem(name: "b", text: "单选框2"),
];

RadioGroup(
  value: 'a',
  list: list,
  ...
)
```

更多例子请参考[Demo](../example/lib/routes/demoRadio.dart)

### API

#### RadioGroup

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| list | 选项 | `List` | - |
| value | 选中项的标识符 | `String` | - |
| shape | 所有选项的形状 | `String` | `round` |
| inCellGroup | 是否为单元格组件 | `bool` | `false` |
| disabled | 是否禁用所有单选框 | `bool` | `false` |
| iconSize | 所有复选框的图标大小 | `double` | |
| checkedColor | 所有复选框的选中状态颜色 | `Color` | - |
| onChange | 当绑定值变化时触发的事件 | `Function` | - |

#### RadioItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| name | 标识符 | `String` | - |
| value | 是否选中 | `bool` | `false` |
| shape | 选项的形状，可选值为`square` | `String` | `round` |
| text | 选项的描述 | `String` | - |
| disabled | 是否禁用复选框 | `bool` | `false` |
| iconSize | 图标大小 | `double` | `20` |
| checkedColor | 选中状态颜色 | `Color` | `blueAccent` |
