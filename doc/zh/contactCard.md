## ContactCard 联系人卡片

### 使用范例
```
import 'package:flutter_vant_kit/main.dart';

ContactCard(
  type: 'add'
  ...
)
```

更多例子请参考[Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoContactCard.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| type | 卡片类型，可选值为`edit` | `String` | `add` |
| name | 联系人姓名 | `String` | - |
| tel | 联系人手机号 | `String` | - |
| editAble | 是否可编辑，当`type=edit`生效 | `bool` | `true` |
| onClick | 点击时触发 | `Function()` | - |
