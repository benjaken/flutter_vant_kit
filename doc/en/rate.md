## Rate

### Example

```
import 'package:flutter_vant_kit/main.dart';

Rate(
  icon: Icons.favorite,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoRate.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| count | Count | `int` | `5` |
| value | Current rate | `int` | - |
| size | Icon size | `double` | `24.0` |
| gutter | Icon spacing | `double` | `4.0` |
| icon | Custom icon | `IconData` | `star` |
| voidIcon | Custom unselected icon | `IconData` | `star_border` |
| color | Selected color | `Color` | `#ffd21e` |
| voidColor | Unselected color | `Color` | `#dcdee0` |
| readonly | Whether it is read-only | `bool` | `false` |
| disabled | whether it is disabled | `bool` | `false` |
| onChange | Triggered when the current rate changes | `Function(String val)` | - |
