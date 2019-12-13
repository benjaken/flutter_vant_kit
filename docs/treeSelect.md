## TreeSelect 分类选择

### 使用范例

```
import 'package:flutter_kit/widgets/treeSelect.dart';

List<SideBarItem> list = [
  SideBarItem(
    title: "浙江",
    children: [
      TreeItem(text: "杭州", id: 1),
      TreeItem(text: "温州", id: 2),
      TreeItem(text: "宁波", id: 3, disabled: true),
      TreeItem(text: "义乌", id: 4),
    ]
  ),
  ...
];

TreeSelect(
  activeId: [1],
  list: list,
)
```

更多例子请参考[Demo](../lib/routes/demoTreeSelect.dart)

### API

#### TreeSelect

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| list | 所有选项 | `List<SideBarItem>` | - |
| mainActiveIndex | 左侧选中项的索引 | `int` | `0` |
| activeId | 右侧选中项的 id | `List<int>` | - |
| height | 高度 | `double` | `300.0` |
| max | 右侧项最大选中个数 | `int` | `1` |
| onChange | 左侧选中值改变时触发 | `Function(List<int> list)` | - |

#### TreeItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| text | 右侧选项名称 | `String` | - |
| id | 右侧选项标识符 | `int` | - |
| disabled | 是否禁用右侧选中项 | `bool` | `false` |
