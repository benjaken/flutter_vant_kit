## Radio

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<RadioItem> list = [
  RadioItem(name: "a", text: "Radio A"),
  RadioItem(name: "b", text: "Radio B"),
];

RadioGroup(
  value: 'a',
  list: list,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoRadio.dart)

### API

#### RadioGroup

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| list | Options | `List` | - |
| value | The identifier of the selected item | `String` | - |
| shape | The shape of all options | `String` | `round` |
| inCellGroup | Whether it is a cell component | `bool` | `false` |
| disabled | Whether to disable all radio boxes | `bool` | `false` |
| iconSize | Icon size for all radio boxes | `double` | |
| checkedColor | Checked state color of all radio boxes | `Color` | - |
| onChange | Triggered when the binding value changes | `Function(String val)` | - |

#### RadioItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| name | Radio Name | `String` | - |
| value | Check status | `bool` | `false` |
| shape | The shape of the option, can be set to `square` | `String` | `round` |
| text | Option description | `String` | - |
| disabled | Disable the radio box | `bool` | `false` |
| iconSize | Icon size | `double` | `20` |
| checkedColor | Checked color | `Color` | `#1989fa` |
