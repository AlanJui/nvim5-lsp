-- =======================================================================
-- LSP Servers Installation
-- =======================================================================
-- require('lsp.nvim-lsp-installer')
-- Automatically install LSP servers
local lsp_installer = require('nvim-lsp-installer')
local servers = {
	'sumneko_lua',
	'pyright',
	'html',
	'emmet_ls',
	'tsserver',
	'vuels',
	'yamlls',
	'bashls',
}
for _, name in pairs(servers) do
	local ok, server = lsp_installer.get_server(name)
	-- Check that the server is supported in nvim-lsp-installer
	if ok then
		if not server:is_installed() then
			print('Installing ' .. name)
			server:install()
		end
	end
end

-- =======================================================================
-- Language Server Configuration
-- =======================================================================
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
local cmp = require('cmp')

local on_attach = require('lsp.on_attach')
local capabilities = require('cmp_nvim_lsp').update_capabilities(
	vim.lsp.protocol.make_client_capabilities()
)

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- Setup completion and snippets engine
--------------------------------------------------------------------------
local lspkind = require('lspkind')

local has_words_before = function ()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function (key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
	formatting = {
		format = lspkind.cmp_format(),
	},
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		-- Snippets shortcut key
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn['vsnip#available']() == 1 then
			  feedkey('<Plug>(vsnip-expand-or-jump)', '')
			elseif has_words_before() then
				cmp.complete()
			else
				-- The fallback function sends a already mapped key. In this case,
			  -- it's probably `<Tab>`.
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn['vsnip#jumpable'](-1) == 1 then
			  feedkey('<Plug>(vsnip-jump-prev)', '')
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
	}, {
	  { name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup comp with lspconfig.
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
-- 	capabilities = capabilities
-- }

-- Setup Language Server
--------------------------------------------------------------------------

lsp_installer.on_server_ready(function (server)
	-- Specify the default options which we'll use for all LSP servers
	local default_opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	-- Create a server_opts table where we'll specify our custom LSP server configuration
	local server_opts = {
		['pyright'] = function ()
			default_opts.cmd = { "pyright-langserver", "--stdio" }
			default_opts.filetypes = { "python" }
			default_opts.on_attach = on_attach
			default_opts.capabilities = capabilities

			return default_opts
		end,

		['tsserver'] = function ()
			default_opts.cmd = {
				'typescript-language-server',
				'--stdio',
			}

			default_opts.filetypes = {
				'javascript',
				'javascriptreact',
				'typescript',
				'typescriptreact',
			}

			default_opts.on_attach = on_attach
			default_opts.capabilities = capabilities

			return default_opts
		end,

		['html'] = function ()
			default_opts.cmd = { "vscode-html-language-server", "--stdio" }
			default_opts.filetypes = {
				"html",
				"htmldjango",
				"css",
			}
			default_opts.on_attach = on_attach
			default_opts.capabilities = capabilities

			return default_opts
		end,

		['emmet_ls'] = function ()
			default_opts.cmd = { "emmet-ls", "--stdio" }
			default_opts.filetypes = {
				"html",
				"htmldjango",
				"css",
			}
			default_opts.on_attach = on_attach
			default_opts.capabilities = capabilities

			return default_opts
		end,

		['sumneko_lua'] = function ()
			-- bin: $HOME/.local/share/nvim/lsp_servers/sumneko_lua/extensions/bin/$OS/lua-language-server
			-- root: $HOME/.local/share/nvim/lsp_servers/sumneko_lua/extensions/bin/$OS/main.lua
			local lua_root_path = vim.fn.stdpath('data') .. '/lsp_servers/sumneko_lua/extension/server/bin/' .. system_name
			local lua_binary = lua_root_path .. '/lua-language-server'

			-- bin: $HOME/.local/share/lua-language-server/bin/$OS/lua-language-server
			-- root: $HOME/.local/share/lua-language-server/main.lua
			-- local USER_HOME_PATH = os.getenv('HOME')
			-- local LUA_INSTALL_PATH = USER_HOME_PATH .. '/.local/share/lua-language-server'
			-- local lua_root_path = LUA_INSTALL_PATH
			-- local lua_binary = lua_root_path .. '/bin/' .. system_name .. '/lua-language-server'

			local runtime_path = vim.split(package.path, ';')
			table.insert(runtime_path, 'lua/?.lua')
			table.insert(runtime_path, 'lua/?/init.lua')

			default_opts.cmd = {
				lua_binary,
				'-E',
				lua_root_path .. '/main.lua',
			}

			default_opts.settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT',
						-- Setup your lua path
						path = runtime_path,
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {'vim'},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
					  enable = false,
					},
				},
			}

			default_opts.on_attach = on_attach
			default_opts.capabilities = capabilities
			return default_opts
		end,
	}

	-- We check to see if any custom server_opts exist for the LSP server, if so, load them,
	-- if not, use our default_opts
	server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
	vim.cmd([[
		" do User LspAttachBuffers
	]])
end)


-- Snippets Engine
--------------------------------------------------------------------------
-- require('lsp.LuaSnip')
-- require('lsp.vim-vsnip')

-- UI Tools
--------------------------------------------------------------------------
require('lsp.lspsaga')
