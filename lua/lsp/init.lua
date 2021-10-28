-- =======================================================================
-- Language Server Configuration
-- =======================================================================


-- Language Server Setup
--------------------------------------------------------------------------

-- Setup LS for Python / TypeScript / C && C++
require('lsp.misc-ls')

-- Setup Language Server for Bash
require('lspconfig').bashls.setup{}

-- Setup Language Server for Lua
require('lsp.lua')

-- TypeScript
-- require('lsp.typescript-ls')

-- Python
-- require('lsp.python-diagnostic-ls')

-- Diagnostic Language Server
-- require('lsp.diagnostic-languageserver')
-- Javascript, JavaScriptReact
require('lsp.dls-javascript')

-- Snippets
--------------------------------------------------------------------------
-- require('lsp/vim-vsnip')
require('lsp/LuaSnip')

-- UI Tools
--------------------------------------------------------------------------
require('lsp/lspsaga')
