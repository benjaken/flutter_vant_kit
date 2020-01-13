## AddressEdit

### Example

```
import 'package:flutter_vant_kit/main.dart';

AddressEdit(
  showDelete: true,
  showSetDefault: true,
  addressInfo: {
    "name": "Zhang San",
    "tel": "18345234123",
    "province": "Guangdong",
    "city": "Shen Zhen",
    "county": "Nan Shan",
    "provinceId": 0,
    "cityId": 1,
    "countyId": 0,
    "addressDetail": "MingZhu Garden",
    "postalCode": "515000",
    "isDefault": true
  },
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoAddressEdit.dart)

### API

#### AddressEdit

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| areaColumnsPlaceholder | placeholder of area columns | `String` | `Select province / city / district` |
| addressInfo | Address Info | `Map<String, dynamic>` | - |
| showPostal | Whether to show postal code | `bool` | `true` |
| showDelete | Whether to show the delete button | `bool` | `false` |
| showSetDefault | Whether to show the default address bar | `bool` | `false` |
| saveButtonText | Save button text | `String` | `save` |
| deleteButtonText | Delete button text | `String` | `delete` |
| detailRows | Number of detail address input lines | `int` | `1` |
| detailMaxlength | Max address length | `int` | `200` |
| children | Custom Content | `List<Widget>` | - |
| onSave | Triggered when click the save button | `Function(Map map)` | - |
| onDelete | Triggered when delete the address | `Function(Map map)` | - |
| onCancelDelete | Triggered when cancel an address | `Function(Map map)` | - |

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
