-- =======================================================================
-- Language Server Configuration
-- =======================================================================
-- require('lsp.nvim-lsp-installer')
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

-- Python(Pyright) Language Server
lspconfig.pyright.setup({
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(fname)
        local root_files = {
            'pyproject.toml',
            'setup.py',
            'setup.cfg',
            'requirements.txt',
            'Pipfile',
            'pyrightconfig.json',
        }
        return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end,
    settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
    },
	on_attach = on_attach,
	capabilities = capabilities,
})

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
	on_attach = on_attach,
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
	on_attach = on_attach,
	capabilities = capabilities,
})
vim.g.completion_trigger_character = { '.' }

-- Lua Language Server
-- require('lsp.lsp-lua')
local USER_HOME_PATH = os.getenv('HOME')
-- local LUA_INSTALL_PATH = USER_HOME_PATH .. '/.local/share/nvim/lsp_servers/sumneko_lua'
-- local sumneko_root_path = LUA_INSTALL_PATH .. '/extension/server/bin/' .. system_name
local LUA_INSTALL_PATH = USER_HOME_PATH .. '/.local/share/lua-language-server'
local sumneko_root_path = LUA_INSTALL_PATH
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
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
    },
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Snippets Engine
--------------------------------------------------------------------------
-- require('lsp.LuaSnip')
-- require('lsp.vim-vsnip')

-- UI Tools
--------------------------------------------------------------------------
require('lsp.lspsaga')
