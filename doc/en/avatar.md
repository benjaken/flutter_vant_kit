## Avatar

### Example

```
import 'package:flutter_vant_kit/main.dart';

Avatar(
  type: 'large'
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoAvatar.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| type | Avatar type, can be set to `large``small` | `String` | `normal` |
| size | Avatar size, priority is higher than the size of `type` | `double` |-|
| shape | Avatar shape, can be set to `square` | `String` | `round` |
| color | Avatar background color | `Color` | `#ebedf0` |
| iconColor | Avatar Icon Color | `Color` | `#323233` |
| custom | Custom icon content | `Widget` |-|
| image | Avatar picture content | `ImageProvider` |-|
| onClick | Callback after clicking on the avatar | `Function()` |-|
