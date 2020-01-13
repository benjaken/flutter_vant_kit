## ActionSheet

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<ActionSheetItem> actionList = [
  ActionSheetItem(name: "Option"),
  ...
];

ActionSheet(
  actions: actionList
).show(context);
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoActionSheet.dart)

### API

#### ActionSheetItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| name | Title | `String` | - |
| subname | Subtitle | `String` | - |
| color | Text color | `Color` | `#323233` |
| loading | Whether to be loading status | `bool` | `false` |
| disabled | Whether to be disabled | `bool` | `false` |

#### ActionSheet

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| actions | Options | `List<ActionSheetItem>` | - |
| title | Title | `String` | - |
| cancelText | Text of cancel button | `String` | - |
| description | Description above the options | `String` | - |
| round | Whether to show round corner | `bool` | `true` |
| closeIcon | Close icon | `IconData` | - |
| closeOnClickOverlay | Whether to close when click overlay | `bool` | `true` |
| onSelect | Triggered when click option | `Function(ActionSheetItem actionSheetItem, int index)` | - |
| onCancel | Triggered when the cancel button is clicked | `Function()` | - |
| onClose | Triggered when the menu is closed | `Function()` | - |
| child | custom menu content | `Widget` | - |
