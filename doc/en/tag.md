## Tag

### Example

```
import 'package:flutter_vant_kit/main.dart';

Tag(
  type: "primary"
  text: "Label",
  。。。
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoTag.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| type | Type, can be set to `primary`` success` `danger`` warning` | `String` | `default` |
| size | Size, can be set to `large`` medium` | `String` | `default` |
| text | Text in tags | `String` | - |
| plain | Whether to be plain style | `bool` | `false` |
| round | Whether to be round style | `bool` | `false` |
| mark | Whether to be mark style | `bool` | `false` |
| color | Color | `Color` | `# 1989fa` |
| textColor | Text color | `Color` | - |
| onClose | Whether to be closeable | `Function()` | - |
