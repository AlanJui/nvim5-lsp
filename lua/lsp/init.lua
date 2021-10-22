-- =======================================================================
-- Language Server Configuration
-- =======================================================================

-- Language Server Setup
--------------------------------------------------------------------------

-- Setup Language Server for Bash
require('lspconfig').bashls.setup{}

-- Setup Language Server for Lua
require('lsp/lua')

-- Setup LS for Python / TypeScript / C && C++
require('/lsp/misc-ls')

-- Snippets
--------------------------------------------------------------------------
-- require('lsp/vim-vsnip')
require('lsp/LuaSnip')
