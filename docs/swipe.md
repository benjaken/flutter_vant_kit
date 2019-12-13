## Swipe 轮播

### 使用范例

```
import 'package:flutter_kit/widgets/swipe.dart';

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

更多例子请参考[Demo](../lib/routes/demoSwipe.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| autoPlay | 是否自动播放 | `bool` | `false` |
| interval | 自动轮播间隔 | `Duration` | `Duration(seconds: 3)` |
| duration | 动画时长 | `Duration` | `Duration(seconds: 1)` |
| initialSwipe | 初始位置索引值 | `int` | `0` |
| showIndicators | 是否显示指示器 | `bool` | `true` |
| indicatorSize | 指示器大小 | `double` | `8.0` |
| indicatorColor | 指示器颜色 | `Color` | `blueAccent` |
| scrollDirection | 滚动方向，可选值为`vertical` | `String` | `horizontal` |
| curve | 动画效果 | `Curve` | `fastOutSlowIn` |
| onChange | 每一页轮播后触发 | `function(int val)` | - |
| viewportFraction | 每个页面在滚动方向占据的视窗比例 | `double` | `1.0` |
| children | 显示内容 | `List<Widget>` | - |
| indicator | 自定义指示器 | `Widget` | - |
