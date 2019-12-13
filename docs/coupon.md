## Coupon 优惠券选择器

### 使用范例

```
import 'package:flutter_kit/widgets/coupon.dart';

List<CouponItem> coupons = [
   CoupenItem(
    condition: '无使用门槛\n最多优惠12元',
    description: '描述信息',
    ...
  )
]

showBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Coupon(
        chosenCoupon: _chosenCoupon,
        coupons: coupons,
        disabledCoupons: coupons.sublist(0, 2),
        ...
      );
    }
  );
```

更多例子请参考[Demo](../lib/routes/demoCoupon.dart)

### API

#### Coupon

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| chosenCoupon | 当前选中优惠券的索引 | `int` | - |
| coupons | 可用优惠券列表 | `List<CoupenItem>` | - |
| disabledCoupons | 不可用优惠券列表 | `List<CoupenItem>` | - |
| enabledTitle | 可用优惠券列表标题 | `String` | `可使用优惠券` |
| disabledTitle | 不可用优惠券列表标题 | `String` | `不可使用优惠券` |
| exchangeButtonText | 兑换按钮文字 | `String` | `兑换` |
| exchangeButtonDisabled | 是否禁用兑换按钮 | `bool` | `false` |
| exchangeMaxLength | 兑换码最大长度 | `int` | `10` |
| displayedCouponIndex | 滚动至特定优惠券位置 | `int` | - |
| showCloseButton | 是否显示列表底部按钮 | `bool` | `true` |
| closeButtonText | 列表底部按钮文字 | `String` | `不使用优惠` |
| inputPlaceholder | 输入框文字提示 | `String` | `请输入优惠码` |
| showExchangeBar | 是否展示兑换栏 | `bool` | `true` |
| emptyImage | 列表为空时的占位图 | `Image` | `https://img.yzcdn.cn/vant/coupon-empty.png` |
| onSelect | 优惠券切换回调 | `Function(int val)` | - |
| onExchange | 兑换优惠券回调 | `Function(String val)` | - |

#### CouponItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| name | 优惠券名称 | `String` | - |
| value | 折扣券优惠金额 | `double` | - |
| valueDesc | 折扣券优惠金额文案 | `String` | - |
| unitDesc | 单位文案 | `String` | - |
| condition | 满减条件 | `String` | - |
| startAt | 卡有效开始时间 (时间戳, 单位秒) | `String` | - |
| endAt | 卡失效日期 (时间戳, 单位秒) | `String` | - |
| description | 描述信息，优惠券可用时展示 | `String` | - |
| reason | 不可用原因，优惠券不可用时展示 | `String` | - |
