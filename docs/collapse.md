## Collapse 折叠面板

### 使用范例

```
import 'package:flutter_kit/widgets/collapse.dart';
import 'package:flutter_kit/widgets/collapseItem.dart';

List<CollapseItem> list = [[
  CollapseItem(
    title: "标题1",
    children: <Widget>[
      Text("代码是写出来给人看的，附带能在机器上运行"),
    ],
  ),
  ...
]

Collapse(
  name: ['0']
  list: list,
  ...
)
```

更多例子请参考[Demo](../lib/routes/demoCollapse.dart)

### API

#### Collapse

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| name | 当前展开面板的 name | `List<String>` | - |
| list | 子面板 | `List<CollapseItem>` | - |
| accordion | 是否为手风琴 | `bool` | `false` |
| border | 是否显示外边框 | `bool` | `true` |
| onChange | 切换面板时触发 | `Function(List<String>)` | - |

#### CollapseItem

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| name | 唯一标识符，默认为索引值 | `String` | - |
| isExpanded | 是否为展开 | `bool` | `false` |
| icon | 左侧图标 | `IconData` | - |
| title | 标题栏左侧内容 | `String` | - |
| value | 标题栏右侧内容 | `String` | - |
| label | 标题栏描述信息 | `String` | - |
| rightIcon | 自定义右侧图标 | `Icon` | - |
| clickable | 是否可点击 | `bool` | `true` |
| customTitle | 自定义标题内容 | `Widget` | - |
| customLabel | 自定义标题下方描述 | `Widget` | - |
| content | 面板纯文本内容 | `String` | - |
| children | 自定义面板内容 | `List<Widget>` | - |
| onExpansionChanged | 面板展开后回调 | `Function(bool isExpand)` | - |
