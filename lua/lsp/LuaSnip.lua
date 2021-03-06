-- nvim-cmp
local nvim_lsp = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

-- Snippets
local has_words_before = function ()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Setup nvim-cmp
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
  		with_text = true,
  		maxwidth = 50
  	})
  },
	-- REQUIRED: must specify a snippet engine
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { 'i', 's' }),

		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
  },
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
}

-- Use buffer source for `\`
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
-- 	capabilities = require('cmp_nvim_lsp').update_capabilities(
-- 		vim.lsp.protocol.make_client_capabilities()
-- 	)
-- }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = {
	'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'emmet_ls', 'jsonls'
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
		capabilities = capabilities
  }
end

--[[
-- Beside defining your own snippets you can also load snippets from "vscode-like" packages
-- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.
-- Mind that this will extend  `ls.snippets` so you need to do it after your own snippets or you
-- will need to extend the table yourself instead of setting a new one.
--
-- paths = { "/home/alanjui/.config/nvim/my-snippets" }
]]
-- [Method 1]
-- require("luasnip/loaders/from_vscode").lazy_load()

-- [Method 2]
-- require("luasnip/loaders/from_vscode").lazy_load({ path = "./my-snippets" })

-- [Method 3]
-- require("luasnip/loaders/from_vscode").load({
--   paths = {
-- 		"~/.local/share/nvim/site/pack/packer/start/friendly-snippets",
--     "./my-snippets",
--   }
-- })

-- [Method 4]
-- require("luasnip/loaders/from_vscode").load({
--   include = {"python", "html", "htmldjango", "javascript", "typescript"},
--   paths = {
-- 		"~/.config/nvim/my-snippets",
-- 		"~/.local/share/nvim/site/pack/packer/start/friendly-snippets",
--   }
-- })
require("luasnip/loaders/from_vscode").load({
  paths = {
 		"/home/alanjui/.config/nvim/my-snippets",
  }
})

-- Set completeopt to have a better completion experience
-- vim.cmd([[
-- 	set completeopt=menu,menuone,noselect
-- ]])
-- vim.o.completeopt = 'menu,menuone,noselect'

-- Tells LuaSnip that for a buffer with ft=filetype, snippets from extend_filetypes should be searched as well.
-- filetype_extend(filetype, extend_filetypes)
-- Example: luasnip.filetype_extend("lua", {"c", "cpp"})
luasnip.filetype_extend('htmldjango', {'html', 'htmldjango'})
