## NumberKeyboard

### Example

```
import 'package:flutter_vant_kit/main.dart';

NumberKeyboard(
  title: "Default Number Keyboard",
  closeButtomText: "Submit",
  ...
).show(context);
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoNumberKeyboard.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| value | Current value | `String` | - |
| title | Keyboard Title | `String` | - |
| maxlength | Value maxlength | `int` | - |
| extraKey | Content of bottom left key | `String` | - |
| closeButtomText | Close button text | `String` | - |
| deleteButtonText | Delete button text | `String` | `delete` |
| showDeleteKey | Whether to show the delete button | `bool` | `true` |
| onChange | Triggered when the current input value changes | `Function(String val)` | - |
| onSubmitted | Triggered when the current value's length is equal to the maxlength | `Function(String val)` | - |
| onClose | Triggered when the keyboard is closed | `Function()` | - |
