## Steps

### Example

```
import 'package:flutter_vant_kit/main.dart';

List<StepItem> steps = [
  StepItem ("Buyer Order"),
  StepItem ("Merchant Order"),
  StepItem ("Buyer Pickup"),
  StepItem ("Transaction completed"),
];

Steps(
  steps: steps,
  active: _active
),
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoSteps.dart)

### API

#### Steps

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| steps | All steps | `List <StepItem>` | - |
| active | Active step | `int` | `0` |
| direction | Can be set to `vertical` | `String` | `horizontal` |
| activeColor | Active step color | `Color` | `#07c160` |
| activeIcon | Active icon | `IconData` | `check_circle` |
| inactiveIcon | Inactive icon | `IconData` | - |

#### StepItem

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| title | Step description | `String` | - |
| date | Step date | `String` | - |
