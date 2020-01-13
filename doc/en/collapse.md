## Collapse

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<CollapseItem> list = [[
  CollapseItem(
    title: "Title",
    children: <Widget>[
      Text("Content"),
    ],
  ),
  ...
]

Collapse(
  name: ['0']
  list: list,
  ...
)
```

More examples please refer [Demo](../example/lib/routes/demoCollapse.dart)

### API

#### Collapse

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| name | Current expanded names | `List <String>` | - |
| list | Child panel | `List <CollapseItem>` | - |
| accordion | Whether to be a accordion | `bool` | `false` |
| border | whether to show the outer border | `bool` | `true` |
| onChange | Triggered when switching panel | `Function(List<String>)` | - |

#### CollapseItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| name | Panel identifier | `String` | - |
| isExpanded | Whether to expand | `bool` | `false` |
| icon | Left icon | `IconData` | - |
| title | Title | `String` | - |
| value | Value | `String` | - |
| label | Description | `String` | - |
| rightIcon | Custom Right Icon | `Icon` | - |
| clickable | Clickable | `bool` | `true` |
| customTitle | Custom title | `Widget` | - |
| customLabel | Description under custom header | `Widget` | - |
| content | Panel content | `String` | - |
| children | Custom panel | `List <Widget>` | - |
| onExpansionChanged | Triggered after the panel expanded | `Function (bool isExpand)` | - |
