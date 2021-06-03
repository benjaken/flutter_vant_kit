## ImagePreview 图片预览

### 使用范例

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

更多例子请参考[Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoImagePreview.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| images | 需要预览的图片数组 | `List<Widget>` | - |
| startPosition | 图片预览起始位置索引 | `int` | `0` |
| showIndex | 是否显示页数 | `bool` | `true` |
| showIndicators | 是否显示轮播指示器 | `bool` | `false` |
| swipeDuration | 动画时长 | `Duration` | `Duration(seconds: 1)` |
| closeable | 是否显示关闭图标	| `bool` | `false` |
| close-icon | 关闭图标| `IconData` | - |
| closeIconPosition | 关闭图标位置，可选值为`top-left` `bottom-left` `bottom-right` | `String` | `top-right`|
| onChange | 切换图片时的回调函数 | `Function(int val)` | - |
| onClose | 关闭时触发 | `Function (int index)` | - |
