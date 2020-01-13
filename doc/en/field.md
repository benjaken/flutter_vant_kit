## Field

### Example

```
import 'package:flutter_vant_kit/main.dart';

Field(
  placeholder: "Pleace Input User Name",
  controller: testInput1,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoField.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| controller | Control Properties | `TextEditingController` | - |
| keyboardType | Input Type | `TextInputType` | - |
| focusNode | Focus control | `FocusNode` | - |
| textInputAction | Type in the bottom right corner of the keyboard | `TextInputAction` | `done` |
| label | Field label | `String` | - |
| maxLength | Max length of value | `int` | - |
| placeholder | Placeholder | `String` | - |
| disabled | Whether to disable the field | `bool` | `false` |
| readonly | Read-only | `bool` | `false` |
| require | Whether to display the form required asterisks | `bool` | `false` |
| clearable | Whether to enable clear control | `bool` | `true` |
| autofocus | Autofocus | `bool` | `false` |
| inputFormatters | Check field regularity | `List<TextInputFormatter>` | - |
| Type | Input Type | `String` | `text` |
| rows | The number of rows in the field when `type = textarea` is available | `int` | `2` |
| showWordLimit | Whether to show word limit, need to set the `maxlength` prop | `bool` | `false` |
| error | Whether to mark the input red | `bool` | `false` |
| errorMessage | Bottom Error Copy | `String` | - |
| labelWidth | Left text width | `double` | `90.0` |
| labelAlign | Left text alignment | `TextAlign` | `start` |
| inputAlign | Input box content alignment | `TextAlign` | `start` |
| leftIcon | Left icon | `IconData` | - |
| clickLeft | Triggered when the left icon is clicked | `Function()` | - |
| rightIcon | Right icon | `IconData` | - |
| clickRight | Triggered when the right icon is clicked | `Function()` | - |
| right | Custom right content | `Widget` | - |
| Toolbar Options | Toolbar Customization | `ToolbarOptions` | - |
| onChange | Triggered when the content of the input box changes | `Function(String val)` | - |
| onEditingComplete | Triggered when editing the content | `Function()` | - |
| onClick | Fires when input box gets focus | `Function()` | - |
| onSubmitted | callback for content submission (press enter) | `Function(String val)` | - |
| style | Text Style | `TextStyle` | - |
