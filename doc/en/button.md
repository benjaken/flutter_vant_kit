## Button

### Example

```
import 'package:flutter_vant_kit/main.dart';

NButton(
  text: "Button",
  type: "primary",
  ...
),
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoButton.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| type | Button type, can be set to `primary` `info` `danger` `warning` | `String` | `default` |
| size | Button Size, can be set to `large` `small` `mini` | `String` | `normal` |
| text | Button Text | `String` | - |
| width | Button Width | `double` | - |
| height | Button Height | `double` | - |
| color | Color, support linear-gradient | `Color || Gradient` | - |
| icon | Left Icon | `Icon` | - |
| textColor | Button Text Color | `Color` | - |
| block | Whether to set display block | `bool` | `false` |
| plain | Whether to be plain button | `bool` | `false` |
| square | Whether to be square button | `bool` | `false` |
| round | Whether to be round button | `bool` | `false` |
| disabled | Whether to disable button | `bool` | `false` |
| loading | Whether to show loading status | `bool` | `false` |
| hairline | Whether to use 0.5px border | `bool` | `false` |
| padding | Custom Padding | `EdgeInsets` | - |
| borderRadius | Custom Broder Radius | `BorderRadius` | - |
| onClick | Triggered when click button and not disabled or loading | `Function()` | - |
