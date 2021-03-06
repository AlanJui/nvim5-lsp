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

-- Tab navigation
keymap('n', '<C-S-tab>',  ':TablineBufferPrevious<CR>',  opts)
keymap('n', '<C-tab>',    ':TablineBufferNext<CR>',      opts)
keymap('n', 'gT',  		  ':TablineBufferPrevious<CR>',  opts)
keymap('n', 'gt',  		  ':TablineBufferNext<CR>',      opts)

-- 搬移整行文字
-- vim.cmd([[
-- nmap <S-Down> :m .+1<CR>
-- nmap <S-Up>   :m .-2<CR>
-- imap <S-Down> <Esc>:m .+1<CR>
-- imap <S-Up>   <Esc>:m .-2<CR>
-- vmap <S-Down> :m '>+1<CR>
-- vmap <S-Up>   :m '<-2<CR>
-- ]])
keymap('n', '<S-Down>', ':m .+1<CR>', opts)
keymap('n', '<S-Up>',   ':m .-2<CR>', opts)
keymap('i', '<S-Down>', '<Esc>:m .+1<CR>', opts)
keymap('i', '<S-Up>',   '<Esc>:m .-2<CR>', opts)
keymap('v', '<S-Down>', ":move '>+1<CR>gv-gv", opts)
keymap('v', '<S-Up>',   ":move '<-2<CR>gv-gv", opts)

--
-- 視窗操作
--

-- 切割視窗
keymap('n', '<C-w>-',  ':split<CR>',  opts)
keymap('n', '<C-w>_',  ':vsplit<CR>', opts)
keymap('n', '<C-w>|',  ':vsplit<CR>', opts)

-- 視窗入焦 window Zoom-in/Zoon-out
-- Window Zoom In/Out
keymap('n', '<LocalLeader>wi', '<C-w>| <C-w>_', opts)
keymap('n', '<LocalLeader>wo', '<C-w>=', opts)

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

-- Comment
-- --------------------------------------------------------------
keymap('n', '<C-_>', ':CommentToggle<CR>', { noremap=true })
keymap('v', '<C-_>', ':CommentToggle<CR>', { noremap=true })

-- lspsaga
-- --------------------------------------------------------------
-- Hover Doc
keymap("n", "K", 			":Lspsaga hover_doc<CR>", 			{silent = true})
-- Signature Help
keymap("n", "<C-k>", 	":Lspsaga signature_help<CR>",  {silent = true})
-- Rename
keymap("n", "gr", 	 	":Lspsaga rename<CR>",  				{silent = true})
-- Jump Diagnostic and Show Diagnostics
keymap("n", "]]", 	 	":Lspsaga diagnostic_jump_next<CR>",	{silent = true})
keymap("n", "[[", 	 	":Lspsaga diagnostic_jump_prev<CR>",	{silent = true})
-- Float Terminal
keymap("n", "<C-f>", 	":Lspsaga open_floaterm<CR>",  {silent = true})
keymap("t", "<C-f>", 	"<C-\\><C-n>:Lspsaga close_floaterm<CR>",  {silent = true})


-- ========================================================================
-- WhichKey Configuration
-- ========================================================================

-- Leader configuration
-- ------------------------------------------------------------------------

keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Prefix: <leader>
-- -----------------------------------------------------------------------------

keymap('n', '<Leader>', [[:<C-u>WhichKey "<space>"<CR>]], {silent = true})
keymap('v', '<Leader>', [[:<C-u>WhichKeyVisual "<space>"<CR>]], {silent = true})
vim.call('which_key#register', '<Space>', 'g:which_key_leader')

keymap('n', '<Leader><Up>', '<C-w>k', {silent = true})
keymap('n', '<Leader><Down>', '<C-w>j', {silent = true})
keymap('n', '<Leader><Left>', '<C-w>h', {silent = true})
keymap('n', '<Leader><Right>', '<C-w>l', {silent = true})
keymap('n', '<Leader>sl', ':<C-u>SessionLoad<CR>', {})
keymap('n', '<Leader>ss', ':<C-u>SessionSave<CR>', {})

-- Prefix: g
-- ------------------------------------------------------------------------

keymap('n', 'ga', '<Plug>(EasyAlign)', {})
keymap('x', 'ga', '<Plug>(EasyAlign)', {})

-- Prefix: s
-- ------------------------------------------------------------------------

keymap('n', 's', [[:<C-u>WhichKey "s"<CR>]], {silent = true})
vim.call('which_key#register', 's', 'g:which_key_s')

keymap('n', 'sl', ':HopLine<CR>', {silent = true})
keymap('n', 'ss', ':HopChar2<CR>', {silent = true})
keymap('n', 'sw', ':HopWord<CR>',  {silent = true})

-- Normal mode (mappings without prefix)
-- ------------------------------------------------------------------------

-- Clear highlighting on escale in normal mode.
keymap('n', '<Esc>', ':noh<CR><Esc>', {silent = true, noremap = true})

-- Terminal mode
-- ------------------------------------------------------------------------
keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

-- WhichKey
-- ------------------------------------------------------------------------

vim.g.which_key_leader = {
  ['name']    = '',
  [' ']       = {':Telescope find_files', 'Find files'},
  ['.']       = {':e ~/.config/nvim/init.lua', 'Open init'},
  [',']       = {':Telescope buffers', 'Show buffers'},
  [';']       = {':FloatermNew --wintype=normal --height=10', 'Terminal pane'},
  ['<Up>']    = 'Up window',
  ['<Down>']  = 'Down window',
  ['<Left>']  = 'Left window',
  ['<Right>'] = 'Right window',
  ['e']       = {':NvimTreeToggle', 'File explorer'},
  ['v']       = {':FloatermNew vifm', 'ViFm'},
  ['z']       = {'UndotreeToggle', 'Undo tree'},

  -- Submenus
  -- ----------------------------------------------------------------------

  -- Actions
  ['a'] = {
    ['name'] = '+actions',
    ['h']    = {':let @/ = ""', 'remove search highlight'},
    ['t']    = {':set filetype=htmldjango', 'set file type to django template'},
    ['T']    = {':set filetype=html', 'set file type to HTML'},
    ['d']    = {'gd', 'go to definition'},
    ['D']    = {'gD', 'go to declaration'},
    ['q']    = {':lua vim.lsp.diagnostic.set_loclist()', 'lint code'},
    ['f']    = {':lua vim.lsp.buf.formatting()<CR>', 'format code'},
    ['l']    = {':set wrap!', 'on/off line wrap'},
    ['n']    = {':set nonumber!', 'on/off line-numbers'},
    ['N']    = {':set norelativenumber!', 'on/off relative line-numbers'},
    ['w']    = {':StripWhitespace', 'strip whitespace'},
  },

  -- Buffer
  ['b'] = {
    ['name'] = '+buffer',
    ['c']    = {'BufferClose', 'Close buffer'},
    ['C']    = {'BufferCloseAllButCurrent', 'Close all but current'},
    ['d']    = {'bdelete', 'Delete buffer'},
    ['p']    = {'BufferPick', 'Buffer pick'},
    ['s']    = {':setlocal spell!', 'Toggle spell'},
    ['w']    = {':StripWhitespace', 'Strip white space'},
    ['W']    = {':ToggleWhitespace', 'Toggle white space'},
    ['[']    = {'BufferPrevious', 'Prev. buffer'},
    [']']    = {'BufferNext', 'Next buffer'}
  },

  -- File
  ['f'] = {
    ['name'] = '+file',
    ['a']    = {':Telescope live_grep', 'Find word'},
    ['b']    = {':Telescope marks', 'Bookmarks'},
    ['f']    = {':Telescope find_files', 'Find files'},
    ['h']    = {':Telescope oldfiles', 'History'},
    ['r']    = {':FloatermNew ranger', 'Picture Viewer'},
    ['v']    = {':FloatermNew vifm', 'ViFm'},
  },

  -- Git
  ['g'] = {
    ['name'] = '+git',
    ['a']    = {':Git add .', 'add all' },
    ['b']    = {':Git blame', 'blame' },
    ['B']    = {':GBrowse', 'github browse' },
    ['c']    = {':Git commit', 'commit' },
    ['d']    = {':Git diff', 'diff' },
    ['D']    = {':Gdiffsplit', 'diff split' },
    ['g']    = {':GGrep', 'git grep' },
    ['l']    = {':Git log', 'log' },
    ['p']    = {':Git push', 'push' },
    ['P']    = {':Git pull', 'pull' },
    ['r']    = {':GRemove', 'remove' },
    ['s']    = {':Git', 'status'},
    ['t']    = {':GitGutterSignsToggle', 'toggle signs' },
    ['v']    = {':GV', 'view commits' },
    ['V']    = {':GV!', 'view buffer commits' },
  },

  -- Gist
  ['G'] = {
    ['name'] = '+gist',
    ['a']    = {':Gist -a', 'post gist anon' },
    ['b']    = {':Gist -b', 'post gist browser' },
    ['d']    = {':Gist -d', 'delete gist' },
    ['e']    = {':Gist -e', 'edit gist' },
    ['l']    = {':Gist -l', 'list public gists' },
    ['s']    = {':Gist -ls', 'list starred gists' },
    ['m']    = {':Gist -m', 'post gist all buffers' },
    ['p']    = {':Gist -p', 'post public gist' },
    ['P']    = {':Gist -P', 'post private gist' },
  },

  -- Bookmark
  ['m'] = {
    ['name'] = '+bookmark',
    ['m']    = {':BookmarkToggle', 'Toogle bookmark'},
    ['i']    = {':BookmarkAnnotate', 'Annotate bookmark'},
    ['n']    = {':BookmarkNext', 'Next bookmark'},
    ['p']    = {':BookmarkPrev', 'Prev. bookmark'},
  },

  ['l'] = {
    ['name'] = '+language',
    ['c']    = {
      ['name'] = '+Comments',
			['r']    = {":call v:lua.vim.lsp.buf.rename()", 'Rename'},
			['f']    = {":call v:lua.vim.lsp.buf.formatting()", 'Formatting'},
			['d']    = {":call v:lua.vim.lsp.buf.declaration()", 'Go to declaration'},
			['D']    = {":call v:lua.vim.lsp.buf.definition()", 'Go to definition'},
      ['.']    = {
        ['name'] = '+with dot',
        ['l']    = {":call v:lua.require('utils/align_comment').align_comments_with_char('.', 'l')", 'To the left'},
        ['c']    = {":call v:lua.require('utils/align_comment').align_comments_with_char('.', 'c')", 'To the center'},
        ['r']    = {":call v:lua.require('utils/align_comment').align_comments_with_char('.', 'r')", 'To the right'},
      },
    },
    ['d']    = {
      ['name'] = '+DiagList',
			['a']    = {":call v:lua.require('diaglist').open_all_diagnostics()", 'All diagnostics'},
			['b']    = {":call v:lua.require('diaglist').open_buffer_diagnostics()", 'Buffer diagnostics'},
    },
    ['p']    = {
      ['name'] = '+Python',
			['d']    = {':FloatermNew python manage.py shell', 'Django-admin Shell'},
			['p']    = {':FloatermNew python', 'Python shell'},
    	['v']    = {':Vista!!', 'toogle vista view window'},
    }
  },

  -- utilities
  ['u'] = {
    ['name'] = '+utility',
    ['t']    = {
      ['name'] = '+Terminal',
    	[';']    = {':FloatermNew --wintype=normal --height=6', 'Terminal pane'},
			['d']    = {':FloatermNew python manage.py shell', 'Django-admin Shell'},
			['p']    = {':FloatermNew python', 'Python shell'},
			['n']    = {':FloatermNew node', 'Node.js shell'},
    },
    ['l']    = {
      ['name'] = '+LiveServer',
			['l']    = {':Bracey', 'start live server'},
			['L']    = {':BraceyStop', 'stop live server'},
			['r']    = {':BraceyReload', 'web page to be reloaded'},
		},
    ['m']    = {
      ['name'] = '+Markdown',
			['m']    = {':MarkdownPreview', 'start markdown preview'},
			['M']    = {':MarkdownPreviewStop', 'stop markdown preview'},
		},
    ['u']    = {
      ['name'] = '+UML',
			['v']    = {':PlantumlOpen', 'start PlantUML preview'},
			['o']    = {':PlantumlSave docs/diagrams/out.png', 'export PlantUML diagram'},
		},
		['f']    = {':FloatermNew vifm', 'ViFm'},
    ['g']    = {':FloatermNew lazygit', 'Lazygit'},
    ['p']    = {':FloatermNew ranger', 'Picture Viewer'},
    ['t']    = {':FloatermNew', 'Terminal window'},
  },

  -- Window
  ['w'] = {
    ['name'] = '+window',
    ['-']    = {'split',   'Horiz. window'},
    ['|']    = {'vsplit',  'Vert. window'},
    ['z']    = {'<C-W>_',  'Zoom-in'},
    ['Z']    = {'<C-W>|',  'Zoom-in (Vertical)'},
    ['o']    = {'<C-W>=',  'Zoom-out'},
    ['c']    = {'close',   'Close window'},
    ['k']    = {'<C-w>k',  'Up window'},
    ['j']    = {'<C-w>j',  'Down window'},
    ['h']    = {'<C-w>h',  'Left window'},
    ['l']    = {'<C-w>l',  'Right window'},
    ['w']    = {':exe "resize" . (winwidth(0) * 3/2)',           'Increase weight'},
    ['W']    = {':exe "resize" . (winwidth(0) * 2/3)',           'Increase weight'},
    ['v']    = {':exe "vertical resize" . (winheight(0) * 3/2)', 'Increase height'},
    ['V']    = {':exe "vertical resize" . (winheight(0) * 2/3)', 'Increase height'},
  }
}

vim.g.which_key_s = {
  ['name'] = 'Hop',
  ['l']    = 'Hop line',
  ['s']    = 'Hop char 2',
  ['w']    = 'Hop word'
}

-- --Remap space as leader key
-- vim.api.nvim_set_keykeymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- -- Highlight on yank
-- vim.api.nvim_exec(
--   [[
--   augroup YankHighlight
--     autocmd!
--     autocmd TextYankPost * silent! lua vim.highlight.on_yank()
--   augroup end
-- ]],
--   false
-- )

-- -- Y yank until the end of line
-- vim.api.nvim_set_keykeymap('n', 'Y', 'y$', { noremap = true })
