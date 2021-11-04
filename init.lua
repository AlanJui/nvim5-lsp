-- =======================================================================
-- Default Setting
-- =======================================================================
local USER_HOME_PATH = os.getenv('HOME')
local PYENV_ROOT_PATH = USER_HOME_PATH .. '/.pyenv'
local PYENV_GLOBAL_PATH = PYENV_ROOT_PATH .. '/versions/venv-397'
local PYTHON_BINARY = PYENV_GLOBAL_PATH .. '/bin/python3'

vim.g.python3_host_prog = PYTHON_BINARY
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- =======================================================================
-- Plugins
-- =======================================================================
-- Load plugins
require('plugins')

-- =======================================================================
-- Language Server Configuration
-- =======================================================================
require('lsp')

-- =======================================================================
-- Plugins Confiugration
-- =======================================================================
-- path: ~/.config/nvim/after/plugin/<PluginName>.rc.vim
-- path: ~/.config/nvim/after/plugin/<PluginName>.lua

-- =======================================================================
-- Keymappings
-- =======================================================================
require('keymappings')

-- =======================================================================
-- User Interface
-- =======================================================================

-- Themes
vim.o.termguicolors = true
vim.cmd([[ run time ./colors/NeoSolarized.vim ]])
-- vim.cmd([[ run time ./colors/solarized_true.vim ]])

-- Display Line Number
vim.cmd([[ set number relativenumber ]])

-- Disable line wrap
vim.opt.textwidth=0
vim.opt.wrapmargin=0
vim.wo.wrap = false
