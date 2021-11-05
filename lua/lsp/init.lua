-- =======================================================================
-- Language Server Configuration
-- =======================================================================
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup Language Server
--------------------------------------------------------------------------
-- Lua Language Server
require('lsp.lsp-lua')

-- HTML Language Server
lspconfig.html.setup({
    cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = {
		"html",
		"htmldjango",
		"css",
	},
    init_options = {
      configurationSection = { "html", "htmldjango", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
    },
	root_dir = function(fname)
	  return util.root_pattern('package.json', '.git')(fname) or util.path.dirname(fname)
	end,
    settings = {},
	capabilities = capabilities,
})

-- Emmet Language Server
lspconfig.emmet_ls.setup({
	cmd = { 'emmet-ls', '--stdio' },
	filetypes = {
		'html',
		'htmldjango',
		'css',
	},
	root_dir = util.root_pattern('package.json', '.git'),
	-- root_dir = function (fname)
	-- 	return vim.loop.cwd()
	-- end,
	settings = {},
	capabilities = capabilities,
})
vim.g.completion_trigger_character = { '.' }

-- Snippets Engine
--------------------------------------------------------------------------
-- require('lsp.LuaSnip')
require('lsp.vim-vsnip')

-- UI Tools
--------------------------------------------------------------------------
require('lsp/lspsaga')
