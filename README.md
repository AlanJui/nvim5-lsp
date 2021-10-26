# 專案指引

專案目標：

- 支援 Neovim LSP
- Auto-completion
- 可使用 snippets 便利程式碼之撰寫支援 Snippets
- S 使用之 Snippets 引， VS Code dfb 檔客案格式
- 支援 Diagnostic Language Server
- 原始程式碼中的錯誤、警告能有「總數統計」，「指明所在位置」
- 可滿足 Django 專案使用者需求

# 需安裝之開發工具

- Node.JS
- Lua
- Python

# 需安裝之 Language Server

- Pyright
- Lua LS
- TypeScript LS

# pylint log format

```
❯ pylint pylint.py
************* Module pylint
pylint.py:1:0: C0114: Missing module docstring (missing-module-docstring)
pylint.py:5:0: C0103: Class name "car" doesn't conform to PascalCase naming style (invalid-name)
pylint.py:5:0: C0115: Missing class docstring (missing-class-docstring)
pylint.py:5:0: R0903: Too few public methods (0/2) (too-few-public-methods)
pylint.py:11:0: C0116: Missing function or method docstring (missing-function-docstring)
pylint.py:11:16: W0613: Unused argument 'car2' (unused-argument)

-----------------------------------
Your code has been rated at 1.43/10
```

<FileName>:<line>:<column>:<MsgID>:<MsgDetail> (MsgTitle)
