-- nvim-cmp
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local lspkind = require('lspkind')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local has_words_before = function ()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function (key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
	formatting = {
		format = lspkind.cmp_format(),
	},

	snippet = {
		expand = function(args)
			-- You must install `vim-vsnip` if you use the following as-is.
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},

	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-y>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>']  = cmp.mapping.confirm({ select = true }),
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

	-- You should specify your *installed* sources.
	sources = {
		{ name = 'lspcofnig' },

		-- For vsnip user
		{ name = 'vsnip' },

	    { name = 'buffer ' },
	},
}

-- Setup lspconfig
-- require('lspconfig')['pyright'].setup {
-- 	capabilities = capabilities,
-- }
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
-- for _, lsp in ipairs(servers) do
-- 	lspconfig[lsp].setup({
-- 		capabilities = capabilities,
-- 	})
-- end

-- vim.g.vsnip_snippet_dir = "./my-snippets"
-- vim.g.vsnip_snippet_dir = "~/.config/nvim/my-snippets"

vim.cmd([[
	set completeopt=menu,menuone,noselect

	let g:vsnip_snippet_dirs = [ '~/.config/nvim/my-snippets', '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' ]

	let g:vsnip_filetypes = {}
	let g:vsnip_filetypes.htmldjango = ['html']
	let g:vsnip_filetypes.javascriptreact = ['javascript']
	let g:vsnip_filetypes.typescriptreact = ['typescript']
]])
