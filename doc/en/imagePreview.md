## ImagePreview

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<Widget> images = [
  Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
  Image.network("https://img.yzcdn.cn/vant/apple-2.jpg"),
  ...
];

showImagePreview(
  context: context,
  images: images,
);
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoImagePreview.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| images | Images list | `List <Widget>` | - |
| startPosition | Start position | `int` | `0` |
| showIndex | Whether to show index | `bool` | `true` |
| showIndicators | Whether to show indicators | `bool` | `false` |
| swipeDuration | Animation duration | `Duration` | `Duration(seconds: 1)`|
| closeable | Whether to show close icon | `bool` | `false`|
| closeIcon | Close icon | `IconData` | -|
| closeIconPosition | Close icon position，can be set to `top-left` `bottom-left` `bottom-right` | `String` | `top-right`|
| onChange | Triggered when current image change | `Function (int val)` | - |
| onClose | Emitted when closing ImagePreview | `Function (int index)` | - |
