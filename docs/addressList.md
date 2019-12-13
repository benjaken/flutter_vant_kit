## AddressList 地址列表

### 使用范例

```
import 'package:flutter_kit/widgets/addressList.dart';

List<AddressInfo> list = [
  AddressInfo(
    name: "张三",
    tel: "18345234123",
    province: "广东省",
    city: "深圳市",
    county: "南山区",
    addressDetail: "明珠花园 5 栋 304 房",
    postalCode: "515000",
    isDefault: true
  )
]

AddressList(
  id: 0,
  list: list,
  top: Title("基本用法"),
  disabledList: disabledList,
  ...
)
```

更多例子请参考[Demo](../lib/routes/demoAddressList.dart)

### API

#### AddressList

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| id | 当前选中地址的 id | `int` | - |
| list | 地址列表 | `List<AddressInfo>` | - |
| disabledList | 不可配送地址列表 | `List<AddressInfo>` | - |
| mode | 显示模式，可选值为`simple` | `String` | `multi` |
| disabledText | 不可配送提示文案 | `String` | `以下地址超出配送范围` |
| switchable | 是否允许切换地址 | `bool` | `true` |
| addButtonText | 底部按钮文字 | `String` | `新增地址` |
| defaultTagText | 默认地址标签文字 | `String` | `默认` |
| onAdd | 点击新增按钮时触发 | `Function()` | - |
| onEdit | 点击编辑按钮时触发 | `Function(AddressInfo info, int i)` | - |
| onSelect | 切换选中的地址时触发 | `Function(AddressInfo info, int i)` | - |
| top | 在顶部插入内容 | `Widget` | - |
| children | 在列表下方插入内容 | `Widget` | - |

#### AddressInfo

| 参数  | 说明  | 类型  |
| ------------ | ------------ | ------------ |
| name | 姓名 | `String` |
| tel | 手机号码 | `String` |
| province | 省份 | `String` |
| city | 城市名 | `String` |
| county | 区名 | `String` |
| addressDetail | 详细地址 | `String` |
| postalCode | 邮政编号 | `String` |
| isDefault | 是否为默认地址 | `bool` |
