-- ==============================================================
-- Keybindings
-- ==============================================================

-- 個人用
-- --------------------------------------------------------------
-- local map = vim.api.nvim_set_keymap
local keymap = require('utils.set_keymap')
local opts = { silent=true, noremap=true }

vim.g.maplocalleader = ','

keymap('i', 'jj',    '<Esc>', opts)
keymap('n', 'H',     '0',     opts)
keymap('n', 'L',     '$',     opts)
keymap('n', 'X',     'd$',    opts)
keymap('n', 'Y',     'y$',    opts)

keymap('n', '<LocalLeader>cci', ':e ~/.config/nvim/init.lua<CR>', opts)
keymap('n', '<LocalLeader>ccl', ':e ~/.config/nvim/lua/lsp/init.lua<CR>', opts)
keymap('n', '<LocalLeader>ccp', ':e ~/.config/nvim/lua/plugins.lua<CR>', opts)
keymap('n', '<LocalLeader>cck', ':e ~/.config/nvim/lua/keymappings.lua<CR>',opts)
keymap('n', '<LocalLeader>w',  ':w<CR>', opts)
keymap('n', '<C-s>',           ':w<CR>', opts)
keymap('n', '<C-q>',           ':q!<CR>', opts)
keymap('n', '\\',              ':Explore<CR>', opts)
keymap('n', '<LocalLeader>f',  ':!ls<CR>:e', opts)

-- 搬移整行文字
-- keymap('n', '<A-j>', ':m .+1<CR>', { noremap=true })
-- keymap('n', '<A-k>', ':m .-2<CR>', { noremap=true })
vim.cmd([[
nmap <A-j> :m .+1<CR>
nmap <A-k> :m .-2<CR>
imap <A-j> <Esc>:m .+1<CR>
imap <A-k> <Esc>:m .-2<CR>
vmap <A-j> :m '>+1<CR>
vmap <A-k> :m '<-2<CR>
]])

--
-- 視窗操作
--

-- 視窗入焦 window Zoom-in/Zoon-out
vim.cmd([[
nmap <LocalLeader>wi <C-W>_ \| <c-w>\|
nmap <LocalLeader>wo <C-W>=
]])

-- 視窗寬度／高度調增／減
-- (1) 水平減小
-- (2) 水平增長
-- (3) 垂直增長
-- (4) 垂直減小

vim.cmd([[
nmap <S-left>  <C-w><
nmap <S-right> <C-w>>
nmap <S-up>    <C-w>+
nmap <S-down>  <C-w>-
]])

-- 調整視窗的寬度／高度
-- 指令：resize (res)
-- 水平調整格式：
--  (1) :res 60
--  (2) :res +5
--  (3) :res -5
-- 垂直調整格式：
--  (1) :vertical res 60
--  (2) :vertical res +5
--  (3) :vertical res -5

vim.cmd([[
nmap <silent> <C-+>          :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nmap <silent> <C-=>          :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nmap <silent> <LocalLeader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nmap <silent> <LocalLeader>- :exe "resize " . (winheight(0) * 2/3)<CR>
]])

-- 半視窗捲動
vim.cmd([[
nmap <A-m> zt
nmap <C-m> zb
]])

-- 在 Tab 視窗移動
vim.cmd([[
nmap <LocalLeader>p <esc>:tabprevious<CR>
nmap <LocalLeader>n <esc>:tabnext<CR>
]])

-- Cursor movement
-- --------------------------------------------------------------
keymap('n', '<up>',   'gk',           opts)
keymap('n', '<down>', 'gj',           opts)
keymap('n', '<home>', 'g<Home>',      opts)
keymap('n', '<end>',  'g<End>',       opts)
keymap('i', '<up>',   '<C-o>gk',      opts)
keymap('i', '<down>', '<C-o>gj',      opts)
keymap('i', '<home>', '<C-o>g<Home>', opts)
keymap('i', '<end>',  '<C-o>g<End>',  opts)

-- Comment
-- --------------------------------------------------------------
keymap('n', '<C-\\>', ':CommentToggle<CR>', { noremap=true })
keymap('v', '<C-\\>', ':CommentToggle<CR>', { noremap=true })

-- Tab navigation
keymap('n', '<C-S-tab>',  ':TablineBufferPrevious<CR>',  opts)
keymap('n', '<C-tab>',  	':TablineBufferNext<CR>',      opts)
keymap('n', 'gT',  				':TablineBufferPrevious<CR>',  opts)
keymap('n', 'gt',  				':TablineBufferNext<CR>',      opts)
