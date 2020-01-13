## AddressEdit 地址编辑

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

AddressEdit(
  showDelete: true,
  showSetDefault: true,
  addressInfo: {
    "name": "张三",
    "tel": "18345234123",
    "province": "广东省",
    "city": "深圳市",
    "county": "南山区",
    "provinceId": 0,
    "cityId": 1,
    "countyId": 0,
    "addressDetail": "明珠花园",
    "postalCode": "515000",
    "isDefault": true
  },
  ...
)
```

更多例子请参考[Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoAddressEdit.dart)

### API

#### AddressEdit

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| areaColumnsPlaceholder | 地区选择列占位提示文字 | `String` | `选择省 / 市 / 区` |
| addressInfo | 收货人信息初始值 | `Map<String, dynamic>` | - |
| showPostal | 是否显示邮政编码 | `bool` | `true` |
| showDelete | 是否显示删除按钮 | `bool` | `false` |
| showSetDefault | 是否显示默认地址栏 | `bool` | `false` |
| saveButtonText | 保存按钮文字 | `String` | `保存` |
| deleteButtonText | 删除按钮文字 | `String` | `删除` |
| detailRows | 详细地址输入框行数 | `int` | `1` |
| detailMaxlength | 详细地址最大长度 | `int` | `200` |
| children | 自定义内容 | `List<Widget>` | - |
| onSave | 点击保存按钮时触发 | `Function(Map map)` | - |
| onDelete | 确认删除地址时触发 | `Function(Map map)` | - |
| onCancelDelete | 取消删除地址时触发 | `Function(Map map)` | - |

#### AddressInfo

| 参数 | 说明 | 类型 |
| ------------ | ------------ | ------------ |
| name | 姓名 | `String` |
| tel | 手机号码 | `String` |
| province | 省份 | `String` |
| city | 城市名 | `String` |
| county | 区名 | `String` |
| provinceId | 省份ID | `int` |
| cityId | 城市ID | `int` |
| countyId | 城区ID | `int` |
| addressDetail | 详细地址 | `String` |
| postalCode | 邮政编号 | `String` |
| isDefault | 是否为默认地址 | `bool` |
