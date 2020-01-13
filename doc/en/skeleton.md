## Skeleton

### Example

```
import 'package:flutter_vant_kit/main.dart';

Skeleton(
  row: 3,
  title: true,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoSkeleton.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| row | Row count | `int` | `0` |
| rowWidth | pRow width | `double` | `1` |
| title | Whether to show title placeholder | `bool` | `false` |
| titleWidth | Title width | `double` | `.4` |
| avatar | Whether to show avatar placeholder | `bool` | `false` |
| avatarSize | Size of avatar placeholder | `double` | `36` |
| avatarShape | Shape of avatar placeholder，can be set to `round` | `String` | `suqare` |
| loading | Whether to show skeleton | `bool` | `false` |
| child | display content when skeleton displayed | `Widget` | - |
