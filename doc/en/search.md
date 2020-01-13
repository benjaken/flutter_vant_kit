## Search

### Example

```
import 'package:flutter_vant_kit/main.dart';

 Search(
  showAction: true,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoSearch.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| shape | Shape of field, can be set to `round` | `String` | `square` |
| background | Background color of field | `Color` | `#f7f8fA` |
| maxLength | Max length of value | `int` | `100` |
| placeholder | Placeholder | `String` | `Please enter search keywords` |
| clearable | Whether to be clearable | `bool` | `true` |
| showAction | Whether to show right action button | `bool` | `false` |
| actionText | Cancel Button Text | `String` | `Cancel` |
| disabled | Whether to disable field | `bool` | `false` |
| readonly | Whether to be readonly | `bool` | `false` |
| leftIcon | Left icon | `IconData` | `search` |
| rightIcon | Right icon | `IconData` | - |
| left | Custom left content | `Widget` | - |
| right | Custom right content | `Widget` | - |
| onClickLeft | Triggered when click on the left | `Function()` | - |
| onClickRight | Triggered when click on the right | `Function()` | - |
| onSubmitted | Triggered when click the submit button | `Function(String val)` | - |
| OnCancel | Triggered when click the cancel button | `Function()` | - |
