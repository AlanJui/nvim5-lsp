-- set_keymap.lua

-- set keymap [[
-- ** Vim Script **
-- nnoremap <silent><C-j> :Lspsaga diagnostic_jump_next<CR>
--
-- ** Lua Script **
-- vim.cmd([[ nnoremap <silent><C-j> :Lspsaga diagnostic_jump_next<CR> ]])
-- keymap('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', { silent = tru })
-- ]]

function set_keymap(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return set_keymap
