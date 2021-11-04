-- =======================================================================
-- Language Server Configuration
-- =======================================================================


-- Language Server Setup
--------------------------------------------------------------------------

-- Setup Language Server for Bash
require('lspconfig').bashls.setup{}

-- Setup Language Server for Lua
require('lsp.lsp-lua')

-- Setup LS for Python / TypeScript / C && C++
require('lsp.lsp-misc')

-- TypeScript
-- require('lsp.lsp-typescript')

-- Python
-- require('lsp.lsp-python')

-- Diagnostic Language Server
require('lsp.diagnostic-language-server')
-- require('lsp.dls-javascript')
-- require('lsp.dls-python')

-- Snippets
--------------------------------------------------------------------------
-- require('lsp.snippets.LuaSnip')
require('lsp.snippets.vim-vsnip')

-- UI Tools
--------------------------------------------------------------------------
require('lsp/lspsaga')
