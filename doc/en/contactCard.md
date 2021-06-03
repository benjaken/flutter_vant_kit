## ContactCard

### Example
```
import 'package:flutter_vant_kit/main.dart';

ContactCard(
  type: 'add'
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoContactCard.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| type | Can be set to `edit` | `String` | `add` |
| name | Name | `String` | - |
| tel | Phone | `String` | - |
| editAble | Whether it can be edited, when `type=edit` | `bool` | `true` |
| onClick | Emitted when component is clicked | `Function()` | - |