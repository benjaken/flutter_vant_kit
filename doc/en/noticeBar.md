## NoticeBar

### Example

```
import 'package:flutter_vant_kit/main.dart';

NoticeBar(
  text: "XXXX",
  ...
),
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoNoticeBar.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| color | Text color | `Color` | `#fffbe8` |
| background | Background | `Color` | `#ed6a0c` |
| text | Content | `String` | - |
| leftIcon | Left icon | `IconData` | - |
| mode | Mode, can be set to `closeable`` link` | `String` | - |
| scrollable | Whether to scroll content | `bool` | `true` |
| wrapable | Whether to enable text wrap | `bool` | `true` |
| speed | scroll speed | `int` | `5` |
| delay | Animation delay(s) | `int` | `100` |
| onClose | Triggered when closed | `Function()` | - |
| onClick | Triggered when click notice bar | `Function()` | - |
