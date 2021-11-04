-- =======================================================================
-- Language Server Configuration
-- =======================================================================
local lspconfig = require('lspconfig')
local lsp_installer_servers = require('nvim-lsp-installer.servers')

local server_available, requested_server = lsp_installer_servers.get_server('sumneko_lua')
if server_available then
	requested_server:on_ready(function()
		lspconfig.sumneko_lua.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' }
					},
				},
			},
		})
	end)

	if not requested_server:is_installed() then
		-- Queue the server to be installed
		requested_server:install()
	end
end

-- Provide settings first!
local lsp_installer = require('nvim-lsp-installer')
lsp_installer.settings({
	ui = {
		icons = {
			server_installed = '✓',
			server_pending = '⁉',
			server_uninstalled = ''
		}
	}
})


-- Language Server Setup
--------------------------------------------------------------------------

-- Setup Language Server for Bash
-- require('lspconfig').bashls.setup{}

-- Setup Language Server for Lua
-- require('lsp.lsp-lua')

-- Setup LS for Python / TypeScript / C && C++
-- require('lsp.lsp-misc')

-- TypeScript
-- require('lsp.lsp-typescript')

-- Python
-- require('lsp.lsp-python')

-- Diagnostic Language Server
-- require('lsp.diagnostic-language-server')
-- require('lsp.dls-javascript')
-- require('lsp.dls-python')

-- Snippets
--------------------------------------------------------------------------
-- require('lsp.snippets.LuaSnip')
require('lsp.snippets.vim-vsnip')

-- UI Tools
--------------------------------------------------------------------------
require('lsp/lspsaga')
