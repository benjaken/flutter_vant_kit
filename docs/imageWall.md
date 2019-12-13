## ImageWall 图片选择器

### 使用范例

```
import 'package:flutter_kit/widgets/ImageWall.dart';

List<String> images = [
  "https://storage.360buyimg.com/mtd/home/111543234387022.jpg",
  ...
];

ImageWall(
  images: images,
  count: 6,
  ...
)
```

更多例子请参考[Demo](../lib/routes/demoImageWall.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| images | 图片文件数组 | `List` | - |
| multiple | 是否可以多选图片 | `bool` | `false` |
| length | 单行的图片数量 | `int` | `4` |
| count | 最多可以选择的图片张数 | `int` | `9` |
| imageFit | 图片预览样式 | `BoxFit` | `contain` |
| uploadBtn | 自定义 button | `Widget` | - |
| onChange | 上传后返回全部图片信息 | `Function(List<String> images)` | - |
| onUpload | 监听图片上传 | `Function(List<Asset> file)` | - |
| onRemove | 删除图片后的回调 | `Function(String url)` | - |
