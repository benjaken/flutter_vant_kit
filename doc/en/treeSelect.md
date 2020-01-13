## TreeSelect

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<SideBarItem> list = [
  SideBarItem(
    title: "Zhe Jiang",
    children: [
      TreeItem(text: "Han Zhou", id: 1),
      TreeItem(text: "Wen Zhou", id: 2),
      TreeItem(text: "Ning Bo", id: 3, disabled: true),
      TreeItem(text: "Yi Wu", id: 4),
    ]
  ),
  ...
];

TreeSelect(
  activeId: [1],
  list: list,
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoTreeSelect.dart)

### API

#### TreeSelect

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| list | All options | `List<SideBarItem>` | - |
| mainActiveIndex | The index of selected parent node | `int` | `0` |
| activeId | Id of selected item | `List<int>` | - |
| height | Height | `double` | `300.0` |
| max | Maximum number of selected items | `int` | `1` |
| onChange | Triggered when the selected value on the left changes | `Function(List<int> list)` | - |

#### TreeItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| text | Right option name | `String` | - |
| id | Right option id | `int` | - |
| disabled | Whether to disable the item | `bool` | `false` |
