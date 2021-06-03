## ShareSheet

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<ShareSheetItem> options = [
  ShareSheetItem(name: "WeChat"),
  ...
];

ShareSheet(
  title: "Share Friends",
  options: options
  ...
).show(context);
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoShareSheet.dart)

### API

#### ShareSheetItem

| Attribute | Description | Type  | Default |
| ------------ | ------------ | ------------ | ------------ |
| name | Option name | `String` | - |
| description | Option description | `String` | - |
| icon | Option icon | `Widget` | - |

#### ShareSheet

| Attribute | Description | Type  | Default |
| ------------ | ------------ | ------------ | ------------ |
| options | Share options | `List<ShareSheetItem>` | - |
| title | Title | `String` | - |
| cancelText | Cancel button text | `String` | - |
| description | Description | `String` | - |
| closeOnClickOverlay | Whether to close when overlay is clicked | `bool` | `true` |
| wrap | Whether to display in multiple lines | `bool` | `false` |
| wrapNumber | the display number of each line, when `wrap=true` | `int` | `4` |
| onSelect | Emitted when an option is clicked | `Function(ShareSheetItem shareSheetItem, int index)` | - |
| onCancel | Emitted when the cancel button is clicked | `Function()` | - |
