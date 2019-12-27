## Field 输入框

### 使用范例

```
import 'package:flutter_vant_kit/main.dart';

Field(
  placeholder: "请输入用户名",
  controller: testInput1,
  ...
)
```

更多例子请参考[Demo](../example/lib/routes/demoField.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| controller | 控制属性 | `TextEditingController` | - |
| keyboardType | 输入类型 | `TextInputType` | - |
| focusNode | 焦点控制 | `FocusNode` | - |
| textInputAction | 键盘右下角的类型 | `TextInputAction` | `done` |
| label | 输入框左侧文本 | `String` | - |
| maxLength | 输入的最大字符数 | `int` | - |
| placeholder | 占位提示文字 | `String` | - |
| disabled | 是否禁用输入框 | `bool` | `false` |
| readonly | 是否只读 | `bool` | `false` |
| require | 是否显示表单必填星号 | `bool` | `false` |
| clearable | 是否启用清除控件 | `bool` | `true` |
| autofocus | 自动聚焦 | `bool` | `false` |
| inputFormatters | 检验输入框正则 | `List<TextInputFormatter>` | - |
| type | 输入框类型 | `String` | `text` |
| rows | 输入框行数，当`type=textarea`可用 | `int` | `2` |
| showWordLimit | 显示字数统计 | `bool` | `false` |
| error | 是否将输入内容标红 | `bool` | `false` |
| errorMessage | 底部错误提示文案 | `String` | - |
| labelWidth | 左侧文本宽度 | `double` | `90.0` |
| labelAlign | 左侧文本对齐方式 | `TextAlign` | `start` |
| inputAlign | 输入框内容对齐方式 | `TextAlign` | `start` |
| leftIcon | 左侧图标 | `IconData` | - |
| clickLeft | 点击左侧图标时触发 | `Function()` | - |
| rightIcon | 右侧图标 | `IconData` | - |
| clickRight | 点击右侧图标时触发 | `Function()` | - |
| right | 自定义右侧内容 | `Widget` | - |
| toolbarOptions | 工具栏定制 | `ToolbarOptions` | - |
| onChange | 输入框内容变化时触发 | `Function(String val)` | - |
| onEditingComplete | 输入框内容编辑结束时触发 | `Function()` | - |
| onClick | 输入框获得焦点时触发 | `Function()` | - |
| onSubmitted | 内容提交(按回车)的回调 | `Function(String val)` | - |
| style | 文本样式 | `TextStyle` | - |
