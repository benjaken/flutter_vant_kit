## Stepper

### Example

```
import 'package:flutter_vant_kit/main.dart';

Steppers(
  step: 2,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoStepper.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| value | Current value | `double` | - |
| min | Min value | `double` | `0` |
| max | Max value | `double` | - |
| step | Value change step | `double` | `1` |
| disabled | Whether to disable value change | `bool` | `false` |
| disabledInput | Whether to disable the field | `bool` | `false` |
| size | Custom size | `double` | `20.0` |
| inputWidth | Custom input width | `double` | - |
| showPlus | Whether to show the add button | `bool` | `true` |
| showMinus | whether to show the decrease button | `bool` | `true` |
| decimalLength | Decimal length | `int` | `0` |
| onChange | Triggered when the current value changes | `Function(String val)` | - |
