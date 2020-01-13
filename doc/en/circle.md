## Circle

### Example

```
import 'package:flutter_vant_kit/main.dart';

Progress(
  type: "circular",
  percentage: 30,
  ...
),
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoCircle.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| inactive | Inactive | `bool` | `false` |
| percentage | Progress percentage | `double` | `0` |
| strokeWidth | Stroke width | `double` | `5` |
| showPivot | Whether to show pivot | `bool` | `false` |
| color | Progress color | `Color` | `#1989fa` |
| textColor | Progress text color | `Color` | `#ffffff` |
| trackColor | Track Color | `Color` | `#ebedf0` |
| pivotText | Pivot text | `String` | - |
| pivotColor | Pivot color | `Color` | - |
| circularSize | Circular size | `double` | `120` |
