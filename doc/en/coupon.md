## Coupon

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<CouponItem> coupons = [
   CouponItem(
    condition: 'No usage threshold \nUp to ¥12 discount',
    description: 'Description',
    ...
  )
]

Coupon(
  chosenCoupon: _chosenCoupon,
  coupons: coupons,
  disabledCoupons: coupons.sublist(0, 2),
  ...
).show(context);
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoCoupon.dart)

### API

#### Coupon

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| chosenCoupon | Currently selected coupon | `int` | - |
| coupons | Coupon list | `List<CouponItem>` | - |
| disabledCoupons | Disabled coupon list | `List<CouponItem>` | - |
| enabledTitle | Title of coupon list | `String` | `Available` |
| disabledTitle | Title of disabled coupon list | `String` | `Unavailable` |
| exchangeButtonText | exchange button text | `String` | `Exchange` |
| exchangeButtonDisabled | Whether to disable the exchange button | `bool` | `false` |
| exchangeMaxLength | Max length to enable exchange button | `int` | `10` |
| displayedCouponIndex | Index of displayed coupon | `int` | - |
| showCloseButton | Whether to show the button at the bottom of the list | `bool` | `true` |
| closeButtonText | Close button text | `String` | `Not using offers` |
| inputPlaceholder | Input placeholder | `String` | `Please enter a discount code` |
| showExchangeBar | Whether to show the exchange bar | `bool` | `true` |
| emptyImage | Placeholder image when list is empty | `Image` | `https://img.yzcdn.cn/vant/coupon-empty.png` |
| onSelect | Triggered when change chosen coupon | `Function(int val)` | - |
| onExchange | Triggered when exchange coupon | `Function(String val)` | - |

#### CouponItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| name | Coupon name | `String` | - |
| value | value | `double` | - |
| valueDesc | Value text | `String` | - |
| unitDesc | Unit text | `String` | - |
| condition | Condition | `String` | - |
| startAt | Start time | `String` | - |
| endAt | End time | `String` | - |
| description | Description | `String` | - |
| reason | Unavailable reason | `String` | - |
