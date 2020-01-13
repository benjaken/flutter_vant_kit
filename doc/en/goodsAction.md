## GoodsAction 商品导航

### Example

```
import 'package:flutter_vant_kit/main.dart';

GoodsAction(
  actions: [
    ActionButtonItem(text: "Customer service", icon: Icons.chat_bubble_outline),
    ...
  ],
  buttons: [
    ButtonItem(
      text: "Add to Shopping Cart",
      gradient: LinearGradient(colors: [Color(0xffffd01e), Color(0xffff8917)])
    ),
    ...
  ],
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoGoodsAction.dart)

### API

#### GoodsAction

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| actions | Left icon button | `List <ActionButtonItem>` | - |
| buttons | Right button | `List <ButtonItem>` | - |

#### ActionButtonItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| text | Button text | `String` | - |
| icon | Icon | `IconData` | - |
| info | Content of the badge | `String` | - |
| onClick | Trigger when clicked | `Function()` | - |
| customIcon | Custom icon | `Widget` | - |
| customText | Custom text | `Widget` | - |

#### ButtonItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| text | Button text | `String` | - |
| color | Button color, support linear-gradient | `Color || Gradient` | - |
| disabled | Whether to disable button | `bool` | `false` |
| loading | Whether show loading status | `bool` | `false` |
| onClick | Trigger when clicked | `Function()` | - |
| customText | Custom text | `Widget` | - |
