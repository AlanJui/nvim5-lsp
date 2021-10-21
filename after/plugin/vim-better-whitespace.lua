-- Plugin configuraiton: vim-better-whitespace
-- =============================================================================


-- To enable/disable/toggle whitespace highlighting in a buffer, call one of:
-- :EnableWhitespace
-- :DisableWhitespace
-- :ToggleWhitespace
--
-- To enable/disable stripping of extra whitespace on file save for a buffer, call one of:
-- :EnableStripWhitespaceOnSave
-- :DisableStripWhitespaceOnSave
-- :ToggleStripWhitespaceOnSave


-- let g:better_whitespace_enabled=1
-- let g:strip_whitespace_on_save=1
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1


-- autocmd FileType <desired_filetypes> EnableStripWhitespaceOnSave
vim.api.nvim_exec(
  [[
    autocmd FileType dashboard DisableWhitespace
  ]],
  false
)

-- Disable white spacing highlights.
-- let g:better_whitespace_filetypes_blacklist=[ '<filetype1>', '<filetype2>', '<etc>' ]
-- vim.cmd [[
--   let g:better_whitespace_filetypes_blacklist = ['diff', 'gitcommit', 'qf', 'help', 'markdown', 'dashboard']
-- ]]
vim.g.better_whitespace_filetypes_blacklist = {
  'dashboard', 'packer'
}

-- Don't ask for confirmation before whitespace is stripped when you save the
-- file.
vim.g.strip_whitespace_confirm = 0
