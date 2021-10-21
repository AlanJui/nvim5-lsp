-- nvim-cmp

-- Set completeopt to have a better completion experience
-- vim.cmd([[
-- 	set completeopt=menu,menuone,noselect
-- ]])
-- vim.o.completeopt = 'menu,menuone,noselect'
vim.o.completeopt = 'menuone,noselect'


-- Setup nvim-cmp
local nvim_lsp = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

-- Snippets
local has_words_before = function ()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
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
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Setup lspconfig
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
-- 	capabilities = require('cmp_nvim_lsp').update_capabilities(
-- 		vim.lsp.protocol.make_client_capabilities()
-- 	)
-- }
local servers = {
	'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'html', 'emmet_ls', 'jsonls'
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
		capabilities = require('cmp_nvim_lsp').update_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		)
  }
end

-- Load snippets from my-snippets folder
require("luasnip/loaders/from_vscode").load(
	{
		paths = { "/home/alanjui/.config/nvim/my-snippets" }
	}
)

