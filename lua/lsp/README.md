-- lsp

# 目前問題

1.  vim-cmp 無法與下列用法相容：

```lua
require "vim.lsp.protocol".CompletionItemKind = {
 "  (text)",
 "  (method)",
 "  (fun)",
 "  (constructor)",
 "ﰠ  (field)",
 " (var)",
 "ﴯ  (class)",
 "  (interface)",
 "  (module)",
 "ﰠ  (property)",
 "塞 (unit)",
 "  (value)",
 "  (enum)",
 "  (keyword)",
 "  (snippet)",
 "  (color)",
 "  (file)",
 "  (reference)",
 "  (folder)",
 "  (enum-member)",
 "  (constant)",
 "פּ  (struct)",
 "  (event)",
 "  (operator)",
 "   (type-param)"
}
```

2.  Diagnostic LS 如何與 Python 結合，待解
