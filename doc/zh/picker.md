## Picker 选择器

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

Picker(
  colums: options
  ...
),
```

更多例子请参考[Demo](../example/lib/routes/demoPicker.dart)

### API

#### Picker

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| colums | 对象数组，配置每一列显示的数据 | `List<PickerItem>` | - |
| showToolbar | 是否显示顶部栏 | `bool` | `false` |
| toolbarPosition | 顶部栏位置，可选值为 `bottom` | `String` | `top` |
| title | 顶部栏标题 | `String` | - |
| loading | 是否显示加载状态 | `bool` | `false` |
| itemHeight | 选项高度 | `double` | `44.0` |
| confirmButtonText | 确认按钮文字 | `String` | `确认` |
| cancelButtonText | 取消按钮文字 | `String` | `取消` |
| defaultIndex | 默认选中项索引 | `int || List<int>` | `0 || [0]` |
| level | 多列选择的列数 | `int` | `1` |
| onCancel | 点击取消按钮时触发 | `Function(List<String> selectedValues, dynamic selectedIndex)` | - |
| onConfirm | 点击完成按钮时触发 | `Function(List<String> selectedValues, dynamic selectedIndex)` | - |
| onChange | 选项改变时触发 | `Function(List<String> selectedValues, dynamic selectedIndex)` | - |

#### PickerItem

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| text | 子选项的数据 | `String` | - |
| child | 子选项的下级选项数组 | `List<PickerItem>` | - |
