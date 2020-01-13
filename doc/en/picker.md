## Picker

### Example

```
import 'package:flutter_vant_kit/main.dart';

Picker(
  colums: options
  ...
),
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoPicker.dart)

### API

#### Picker

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| colums | Columns data | `List<PickerItem>` | - |
| showToolbar | Whether to show toolbar | `bool` | `false` |
| toolbarPosition | Toolbar position, cat be set to `bottom` | `String` | `top` |
| title | Top Bar Title | `String` | - |
| loading | whether to show loading status | `bool` | `false` |
| itemHeight | Option height | `double` | `44.0` |
| confirmButtonText | Confirm Button Text | `String` | `Confirm` |
| cancelButtonText | Cancel Button Text | `String` | `Cancel` |
| defaultIndex | Default value index of the picker | `int || List<int>` | `0 || [0]` |
| level | Number of columns for multi-column picker | `int` | `1` |
| onCancel | Triggered when click cancel button | `Function(List<String> selectedValues, dynamic selectedIndex)` | - |
| onConfirm | Triggered when click confirm button | `Function(List<String> selectedValues, dynamic selectedIndex)` | - |
| onChange | triggered when current option is changed | `Function(List<String> selectedValues, dynamic selectedIndex)` | - |

#### PickerItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| text | Picker Item Text | `String` | - |
| child | Picker Item Columns | `List<PickerItem>` | - |
