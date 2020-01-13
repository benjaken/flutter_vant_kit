## Sidebar

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<SideBarItem> list = [
  SideBarItem(
    title: "Title"
  ),
  SideBarItem(
    title: "Title"
  ),
  ...
];

Sidebar(
  list: list,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoSidebar.dart)

### API

#### Sidebar

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| active | Current option | `int` | `0` |
| list | All options | `List<SideBarItem>` | - |
| onChange | Triggered when the current option changes | `Function(int val)` | - |

#### SideBarItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| title | Content | `String` | - |
| dot | Whether to show red dot | `bool` | `false` |
| info | Content of the badge | `String` | - |
| disabled | Whether to be disabled | `bool` | `false` |
| onClick | Triggered when click on the option | `Function(int val)` | - |
| children | Sub-option content | `List` | - |
| content | Custom sub-option content | `Widget` | - |
