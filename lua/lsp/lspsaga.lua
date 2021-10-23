-- lspsaga

-- LSP Saga config & keys https://github.com/glepnir/lspsaga.nvim
local saga = require("lspsaga")

-- Key mapping
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

saga.init_lsp_saga({
  code_action_icon = " ",
  definition_preview_icon = "  ",
  -- diagnostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = "",
})

vim.g.mapleader = ','

-- map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", { silent = true })
vim.cmd([[
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent><C-k> <Cmd>Lspsaga signature_help<CR>
]])

map("n", "<leader>ch", ":Lspsaga hover_doc<CR>", { silent = true })
map("n", "<leader>cs", ":Lspsaga signature_help<CR>", { silent = true })

map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", { silent = true })
map("n", "<leader>ca", ":Lspsaga code_action<CR>", { silent = true })
map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { silent = true })
map("n", "<leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { silent = true })
map("n", "<leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { silent = true })
map("n", "<leader>cr", ":Lspsaga rename<CR>", { silent = true })
map("n", "<leader>cd", ":Lspsaga preview_definition<CR>", { silent = true })

vim.cmd([[
" 打开终端
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
" 关闭终端
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>
]])
