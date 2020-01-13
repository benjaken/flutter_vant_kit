## NoticeBar 通知栏

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

NoticeBar(
  text: "XXXX",
  ...
),
```

更多例子请参考[Demo](../example/lib/routes/demoNoticeBar.dart)

### API

| 参数 | 说明 | 类型 | 默认值 |
| ------------ | ------------ | ------------ | ------------ |
| color | 文本颜色 | `Color` | `#fffbe8` |
| background | 滚动条背景 | `Color` | `#ed6a0c` |
| text | 通知文本内容 | `String` | - |
| leftIcon | 左侧图标 | `IconData` | - |
| mode | 通知栏模式，可选值为`closeable` `link` | `String` | - |
| scrollable | 是否在长度溢出时滚动播放 | `bool` | `true` |
| wrapable | 是否开启文本换行，只在禁用滚动时生效 | `bool` | `true` |
| speed | 滚动速率 | `int` | `5` |
| delay | 动画延迟时间 (s) | `int` | `100` |
| onClose | 关闭通知栏时触发 | `Function()` | - |
| onClick | 点击通知栏时触发 | `Function()` | - |
