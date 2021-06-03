## Badge

### Example

```
import 'package:flutter_vant_kit/main.dart';

Badge(
  value: "10",
  child: ...,
),
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master//example/lib/routes/demoBadge.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| value | Content | `String` | - |
| dot | Whether to show red dot | `bool` | `false` |
| max | Max value，show `{max}+` when exceed，only works when `value` is number | `int` | - |
| color | Custom color | `Color` | `#ee0a24` |
| textColor | Custom cext color | `Color` | `#ffffff` |
| textSize | Custom text size | `double` | `12.0` |
| child | Custom badge | `Widget` | - |
| content | Custom badge content | `Widget` | - |
