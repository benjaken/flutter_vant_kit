## ImagePreview

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<Widget> images = [
  Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
  Image.network("https://img.yzcdn.cn/vant/apple-2.jpg"),
  ...
];

showDialog(
  context: context,
  barrierDismissible: true,
  builder: (BuildContext context) {
    return ImagePreview(
      images: images,
    );
  }
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
| onChange | Triggered when current image change | `Function (int val)` | - |
