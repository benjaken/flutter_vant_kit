## Sidebar 侧边导航

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

List<SideBarItem> list = [
  SideBarItem(
    title: "标签名"
  ),
  SideBarItem(
    title: "标签名"
  ),
  ...
];

Sidebar(
  list: list,
  ...
)
```

更多例子请参考[Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoSidebar.dart)

### API

#### Sidebar

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| active | 当前选项 | `int` | `0` |
| list | 所有选项 | `List<SideBarItem>` | - |
| onChange | 当前值改变时触发 | `Function(int val)` | - |

#### SideBarItem

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| title | 内容 | `String` | - |
| dot | 是否显示右上角小红点 | `bool` | `false` |
| info | 右上角徽标的内容 | `String` | - |
| disabled | 是否禁用该项 | `bool` | `false` |
| onClick | 点击选项后触发 | `Function(int val)` | - |
| children | 子选项内容 | `List` | - |
| content | 自定义子选项内容 | `Widget` | - |
