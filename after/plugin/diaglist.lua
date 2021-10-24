-- diaglist.lua
-- Live-updating Neovim LSP diagnostics in quickfix and loclist
local diaglist = require('diaglist')
local keymap = require('utils.set_keymap')

diaglist.init({
	-- optional settings
	-- below are defaults
	--
	-- increase for noisy servers
	debounce_ms = 50,

	-- list in quickfix only diagnostics from clients
	-- attached to a current buffer
	-- if false, all buffers' clients diagnostics is collected
	buf_clients_only = true,
})

-- vim.cmd([[
-- nmap <space>dw <cmd>lua require('diaglist').open_all_diagnostics()<CR>
-- nmap <space>d0 <cmd>lua require('diaglist').open_buffer_diagnostics()<CR>
-- ]])
local opts = { silent = true }
keymap("n", "<SPACE>dw", ":lua require('diaglist').open_all_diagnostics()<CR>", opts)
keymap("n", "<SPACE>d0", ":lua require('diaglist').open_buffer_diagnostics()<CR>", opts)

