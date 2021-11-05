-- =======================================================================
-- Language Server Configuration
-- =======================================================================

-- Setup Language Server
--------------------------------------------------------------------------
-- Lua Language Server
require('lsp.lsp-lua')

-- HTML Language Server
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup({
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
	--     root_dir = function(fname)
	--   return util.root_pattern('package.json', '.git')(fname) or util.path.dirname(fname)
	-- end,
	capabilities = capabilities,
    settings = {}
})

-- Snippets Engine
--------------------------------------------------------------------------
-- require('lsp.LuaSnip')
require('lsp.vim-vsnip')

-- UI Tools
--------------------------------------------------------------------------
require('lsp/lspsaga')
