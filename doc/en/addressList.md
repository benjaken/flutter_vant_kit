## AddressList

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<AddressInfo> list = [
  AddressInfo(
    name: "Zhang San",
    tel: "18345234123",
    province: "Guangdong",
    city: "Shenzhen",
    county: "Nanshan",
    "provinceId": 0,
    "cityId": 1,
    "countyId": 0,
    addressDetail: "Mingzhu Garden",
    postalCode: "515000",
    isDefault: true
  )
]

AddressList(
  id: 0,
  list: list,
  disabledList: disabledList,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoAddressList.dart)

### API

#### AddressList

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| id | Current selected address id | `int` | - |
| list | Address List | `List<AddressInfo>` | - |
| disabledList | Disabled address list | `List<AddressInfo>` | - |
| disabledText | Disabled text | `String` | `The following address is out of scope of delivery` |
| switchable | Whether to allow switch address | `bool` | `true` |
| addButtonText | Add button text | `String` | `Add Address` |
| defaultTagText | Default tag text | `String` | `default` |
| onAdd | Triggered when click add button | `Function()` | - |
| onEdit | Triggered when click edit button | `Function(AddressInfo info, int i)` | - |
| onSelect | Triggered when select address | `Function(AddressInfo info, int i)` | - |
| top | Insert content at the top | `Widget` | - |
| children | Insert content below the list | `Widget` | - |

#### AddressInfo

| Attribute | Description | Type |
| ------------ | ------------ | ------------ |
| name | Name | `String` |
| tel | Mobile number | `String` |
| province | Province name | `String` |
| city | City name | `String` |
| county | County name | `String` |
| provinceId | Province id | `int` |
| cityId | City id | `int` |
| countyId | County id | `int` |
| addressDetail | Address detail | `String` |
| postalCode | Postal code | `String` |
| isDefault | Whether to be default address | `bool` |
