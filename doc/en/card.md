## Card

### Example

```
import 'package:flutter_vant_kit/main.dart';

NCard(
  title: "Product Name",
  desc: "Description",
  ...
),
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoCard.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| image | Left image | `Image` | - |
| title | Title | `String` | - |
| desc | Description | `String` | - |
| tag | Tag | `String` | - |
| num | Number | `int` | - |
| price | Price | `double` | - |
| originPrice | original price | `double` | - |
| centered | Whether content vertical centered | `bool` | `false` |
| currency | Currency symbol | `String` | `¥`|
| onClick | Triggered when clicked | `Function()` | - |
| customTitle | Custom title | `Widget` | - |
| customDesc | Custom description | `Widget` | - |
| customNum | Custom quantity | `Widget` | - |
| customPrice | Custom price | `Widget` | - |
| customOriginPrice | Custom original price | `Widget` | - |
| customThumb | Custom Pictures | `Widget` | - |
| customTag | Custom picture corner | `Widget` | - |
| customTags | Custom tag area under the description | `Widget` | - |
| customFooter | Custom footer | `Widget` | - |
