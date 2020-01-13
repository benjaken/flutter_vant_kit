## SubmitBar

### Example

```
import 'package:flutter_vant_kit/main.dart';

SubmitBar(
  buttonText: "Submit",
  price: 30.50,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoSubmitBar.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| price | Price | `double` | - |
| label | Price left label | `String` | `Total:` |
| suffixLabel | Price right label | `String` | - |
| textAlign | Price label text align can be set to `left` | `String` | `right` |
| buttonText | Button text | `String` | - |
| tip | Tip | `String` | - |
| tipIcon | Icon | `IconData` | - |
| disabled | Whether to disable button | `bool` | `false` |
| loading | Whether to show loading icon | `bool` | `false` |
| currency | Currency symbol | `String` | `¥` |
| decimalLength | Number of digits to appear after the decimal point | `int` | `2` |
| onSubmit | Triggerd when click submit button | `Function ()` | - |
| customTip | Custom tips | `Widget` | - |
| customTop | Custom top content | `Widget` | - |
| customLeft | Custom left content | `Widget` | - |
