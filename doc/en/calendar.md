## Calendar

### Example

```
import 'package:flutter_vant_kit/main.dart';

DateTime selectedDate;

Calendar(
  defaultDate: selectedDate,
  ...
).show(context);
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoCalendar.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| type | Select type, can be set to `range` | `String` | `single` |
| title | Calendar Title | `String` | `Date Selection` |
| color | Color for the bottom button and selected date | `Color` | `#1989fa` |
| minDate | Min Date | `DateTime` | - |
| maxDate | Max date | `DateTime` | - |
| defaultDate | Default selected date | `DateTime` | - |
| rowHeight | Row height | `double` | - |
| poppable | Whether to show the calendar inside a popup | `bool` | `true` |
| round | Whether to show round corner | `bool` | `true` |
| showMark | Whether to display the background watermark of the month | `bool` | `true` |
| showConfirm | Whether to show the confirmation button | `bool` | `true` |
| closeOnClickOverlay | Whether to close when click overlay | `bool` | `true` |
| confirmText | Confirm button text | `String` | `OK` |
| height | Schedule height, when `poppable = false` | `double` | `400.0` |
| onSelect | Triggered when select date | `Function(DateTime date)` | - |
| onConfirm | Triggered after the date selection is completed, if `showConfirm = true`, it is triggered after clicking the confirm button | `Function(DateTime date)` | - |
