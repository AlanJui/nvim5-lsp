-- =======================================================================
-- Language Server Configuration
-- =======================================================================


-- Language Server Setup
--------------------------------------------------------------------------

-- Diagnostic Language Server
require('lsp.diagnostic-languageserver')

-- Setup Language Server for Bash
require('lspconfig').bashls.setup{}

-- Setup Language Server for Lua
require('lsp.lua')

-- Setup LS for Python / TypeScript / C && C++
require('lsp.misc-ls')

-- TypeScript
-- require('lsp.typescript-ls')

-- Snippets
--------------------------------------------------------------------------
-- require('lsp/vim-vsnip')
require('lsp/LuaSnip')

-- UI Tools
--------------------------------------------------------------------------
require('lsp/lspsaga')


