## Checkbox

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<CheckItem> list = [
  CheckItem(name: "a", text: "Checkbox A"),
  CheckItem(name: "b", text: "Checkbox B"),
  ...
];

CheckboxGroup(
  list: list,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoCheckbox.dart)

### API

#### CheckGroup

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| list | Options | `List` | - |
| value | Identifiers of all selected items | `List` | - |
| shape | The shape of all options | `String` | `round` |
| max | Maximum amount of checked options | `int` | `9999` |
| inCellGroup | Whether it is a cell component | `bool` | `false` |
| disabled | Disable all checkboxes | `bool` | `false` |
| iconSize | Icon size for all checkboxes | `double` | |
| checkedColor | Checked state color of all checkboxes | `Color` | - |
| onChange | Triggered when value changed | `Function(List<String> value)` | - |

#### CheckItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| name | Checkbox name | `String` | - |
| value | Check status | `bool` | `false` |
| shape | The shape of the option, the optional value is `square` | `String` | `round` |
| text | Option description | `String` | - |
| disabled | Checkbox disabled | `bool` | `false` |
| iconSize | Icon size | `double` | `20` |
| checkedColor | Checked color | `Color` | `#1989fa` |
