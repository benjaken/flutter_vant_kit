## Swipe

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<Widget> images = [
  Image.network("https://img.yzcdn.cn/vant/apple-1.jpg"),
  Image.network("https://img.yzcdn.cn/vant/apple-2.jpg"),
  Image.network("https://img.yzcdn.cn/vant/apple-3.jpg"),
  Image.network("https://img.yzcdn.cn/vant/apple-4.jpg")
];

Swipe(
  autoPlay: true,
  children: images,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoSwipe.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| autoPlay | Whether to play automatically | `bool` | `false` |
| interval | Auto Carousel Interval | `Duration` | `Duration(seconds: 3)` |
| duration | Animation duration | `Duration` | `Duration(seconds: 1)` |
| initialSwipe | Initial position index | `int` | `0` |
| showIndicators | Whether to show indicators | `bool` | `true` |
| indicatorSize | Indicator size | `double` | `8.0` |
| indicatorColor | Indicator color | `Color` | `# 1989fa` |
| scrollDirection | Scroll direction, can be set to `vertical` | `String` | `horizontal` |
| curve | Animation | `Curve` | `fastOutSlowIn` |
| onChange | Triggered after each page carousel | `Function(int val)` | - |
| viewportFraction | Proportion of the window occupied by each page in the scroll direction | `double` | `1.0` |
| children | Display content | `List<Widget>` | - |
| indicator | Custom indicator | `Widget` | - |
