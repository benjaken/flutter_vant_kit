## PasswordInput

### Example

```
import 'package:flutter_vant_kit/main.dart';

PasswordInput(
  value: _value,
  info: "Password is 6 digits",
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoPasswordInput.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| value | Password value | `String` | - |
| length | maximum password length | `int` | `6` |
| mask | Whether to hide the password content | `bool` | `true` |
| hideWhenSubmitted | Whether to automatically hide the keyboard when the current value's length is equal to the maxlength | `bool` | `false` |
| info | Bottom info | `String` | - |
| onClick | Triggered when input box is clicked | `Function()` | - |
| onChange | Triggered when the password value changes | `Function(String val)` | - |
| onSubmitted | Triggered when the current value's length is equal to the maxlength | `Function(String val)` | - |
