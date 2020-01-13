## Dialog

### Example

```
import 'package:flutter_vant_kit/main.dart';

NDialog(
  title: 'Title',
  ...
);
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoDialog.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| title | Popup Title | `String` | - |
| message | popup content | `String` | - |
| titleAlign | Title Alignment | `AlignmentDirectional` | `center` |
| messageAlign | Message alignment | `TextAlign` | `center` |
| showConfirmButton | Whether to show the confirm button | `bool` | `true` |
| showCancelButton | whether to show the cancel button | `bool` | `false` |
| confirmButtonText | Confirm button text | `String` | `Confirm` |
| confirmButtonColor | Confirm button color | `Color` | `#ffffff` |
| confirmTextColor | Confirm button text color | `Color` | `#1989fa` |
| cancelButtonText | Cancel button text | `String` | `Cancel` |
| cancelButtonColor | Cancel button color | `Color` | `#ffffff` |
| cancelTextColor | Cancel button text color | `Color` | `#323233` |
| closeOnClickOverlay | Whether to close the popup window after clicking the mask layer | `bool` | `false` |
| onConfirm | triggered when click the confirm button | `Function()` | - |
| onCancel | Triggered when click the cancel button | `Function()` | - |
| beforeClose | Triggered when the dialog is closed | `Function()` | - |
| child | Custom content | `Widget` | - |
