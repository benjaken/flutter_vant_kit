## Pagination 分页

### 使用范例

```
import 'package:flutter_kit/widgets/pagination.dart';

Pagination(
  totalItems: 36,
  ...
)
```

更多例子请参考[Demo](../lib/routes/demoPagination.dart)

### API

| 参数  | 说明  | 类型  | 默认值  |
| ------------ | ------------ | ------------ | ------------ |
| current | 当前页码 | `int` | `1` |
| totalItems | 总记录数 | `int` | `0` |
| itemsPerPage | 每页记录数 | `int` | `10` |
| mode | 显示模式，可选值为`simple` | `String` | `multi` |
| prevText | 上一页 | `String` | `上一页` |
| nextText | 下一页 | `String` | `下一页` |
| showPageSize | 显示的页码个数 | `int` | `5` |
| onChange | 页码改变时触发 | `Function(int page)` | - |
