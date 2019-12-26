## Cell 单元格

### 使用范例

```
import 'package:flutter_vant_kit/widgets/cellGroup.dart';
import 'package:flutter_vant_kit/widgets/cell.dart';

CellGroup(
  children: <Widget>[
    Cell(
      title: "单元格",
      value: "内容"
      ...
    ),
  ]
),
```

更多例子请参考[Demo](../lib/routes/demoCell.dart)

### API

#### CellGroup

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| title | 分组标题 | `String` | - |
| border | 是否显示外边框 | `bool` | `true` |
| decoration | 自定义边框样式 | `BoxDecoration` | - |
| children | 默认插槽 | `List` | - |

#### Cell

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| title | 左侧标题 | `String` | - |
| label | 标题下方的描述信息 | `String` | - |
| value | 右侧内容 | `String` | - |
| icon | 左侧图标 | `IconData` | - |
| size | 单元格大小，可选值为`large` | `String` | `normal` |
| require | 是否显示表单必填星号 | `bool` | `false` |
| clickable | 是否可点击 | `bool` | `false` |
| isLink | 是否展示右侧箭头并开启点击反馈 | `bool` | `false` |
| arrowDirection | 箭头方向，可选值为`left` `up` `down` | `String` | `right` |
| customTitle | 自定义标题内容 | `Widget` | - |
| customLabel | 自定义标题下方描述 | `Widget` | - |
| customRight | 自定义右侧内容 | `Widget` | - |
| onClick | 点击单元格时触发 | `Function` | - |
