## Pagination

### Example

```
import 'package:flutter_vant_kit/main.dart';

Pagination(
  totalItems: 36,
  ...
)
```

More examples please refer [Demo](https://github.com/benjaken/flutter_vant_kit/blob/master/example/lib/routes/demoPagination.dart)

### API

| Attribute | Description | Type | Default |
| ------------ | ------------ | ------------ | ------------ |
| current | Current page | `int` | `1` |
| totalItems | Total items | `int` | `0` |
| itemsPerPage | items per page | `int` | `10` |
| mode | Display mode, can be set to `simple` | `String` | `multi` |
| prevText | Previous Text | `String` | `Previous` |
| nextText | Next Text | `String` | `Next`
| showPageSize | Number of page numbers displayed | `int` | `5` |
| onChange | Triggered when the page number changes | `Function(int page)` | - |
