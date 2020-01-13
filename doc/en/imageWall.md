## ImageWall

### Example

```
import 'package:flutter_vant_kit/main.dart';

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

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoImageWall.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| images | Image file array | `List` | - |
| multiple | Whether to select multiple images | `bool` | `false` |
| count | The maximum number of pictures you can select | `int` | `9` |
| imageFit | Picture Preview Style | `BoxFit` | `contain` |
| uploadBtn | Custom button | `Widget` | - |
| onChange | Triggered when after uploading a image | `Function(List<String> images)` | - |
| onUpload | Triggered when upload the image | `Function(List<Asset> file)` | - |
| onRemove | Triggered when remove the image | `Function(String url)` | - |
