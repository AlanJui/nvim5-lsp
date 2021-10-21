-- ==============================================================
-- Keybindings
-- ==============================================================

-- 個人用
-- --------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local opts = {silent=true, noremap=true}

vim.g.maplocalleader = ','

map('i', 'jj',    '<Esc>', opts)
map('n', 'H',     '0',     opts)
map('n', 'L',     '$',     opts)
map('n', 'X',     'd$',    opts)
map('n', 'Y',     'y$',    opts)

map('n', '<LocalLeader>ci', ':e ~/.config/nvim/init.lua<CR>', opts)
map('n', '<LocalLeader>cl', ':e ~/.config/nvim/lua/lsp/init.lua<CR>', opts)
map('n', '<LocalLeader>cp', ':e ~/.config/nvim/lua/plugins.lua<CR>', opts)
map('n', '<LocalLeader>ck', ':e ~/.config/nvim/lua/keymappings.lua<CR>',opts)
map('n', '<LocalLeader>w',  ':w<CR>', opts)
map('n', '<C-s>',           ':w<CR>', opts)
map('n', '<C-q>',           ':q!<CR>', opts)
map('n', '\\',              ':Explore<CR>', opts)
map('n', '<LocalLeader>f',  ':!ls<CR>:e', opts)

-- 搬移整行文字
-- map('n', '<A-j>', ':m .+1<CR>', { noremap=true })
-- map('n', '<A-k>', ':m .-2<CR>', { noremap=true })
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
map('n', '<up>',   'gk',           {silent = true, noremap = true})
map('n', '<down>', 'gj',           {silent = true, noremap = true})
map('n', '<home>', 'g<Home>',      {silent = true, noremap = true})
map('n', '<end>',  'g<End>',       {silent = true, noremap = true})
map('i', '<up>',   '<C-o>gk',      {silent = true, noremap = true})
map('i', '<down>', '<C-o>gj',      {silent = true, noremap = true})
map('i', '<home>', '<C-o>g<Home>', {silent = true, noremap = true})
map('i', '<end>',  '<C-o>g<End>',  {silent = true, noremap = true})

-- Comment
-- --------------------------------------------------------------
map('n', '<C-\\>', ':CommentToggle<CR>', { noremap=true })
map('v', '<C-\\>', ':CommentToggle<CR>', { noremap=true })

