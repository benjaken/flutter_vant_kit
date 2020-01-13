## Cell

### Example

```
import 'package:flutter_vant_kit/main.dart';

CellGroup(
  children: <Widget>[
    Cell(
      title: "Title",
      value: "Value"
      ...
    ),
  ]
),
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoCell.dart)

### API

#### CellGroup

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| title | Group Title | `String` |-|
| border | Whether to show the outer border | `bool` | `true` |
| decoration | Custom border style | `BoxDecoration` |-|
| children | Default slot | `List` |-|

#### Cell

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| title | Left Title | `String` |-|
| label | Descriptive Information under the Title | `String` |-|
| value | Content on the right | `String` |-|
| icon | Left Icon | `IconData` |-|
| size | Cell Size, can be set to `large` | `String` | `normal` |
| require | Whether to display the form required asterisks | `bool` | `false` |
| clickable | Clickable | `bool` | `false` |
| isLink | Whether to show the right arrow and enable click feedback | `bool` | `false` |
| arrowDirection | Arrow direction, can be set to `left`` up` `down` | `String` | `right` |
| customTitle | Custom title content | `Widget` |-|
| customLabel | Custom Description under custom header | `Widget` |-|
| customRight | Custom Right Content | `Widget` |-|
| onClick | triggered when a cell is clicked | `Function()` |-|
