-- =======================================================================
-- Default Setting
-- =======================================================================
local g = vim.g -- a table to access global variables
g.python3_host_prog = "/home/alanjui/.pyenv/versions/venv-397/bin/python3"
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- =======================================================================
-- Plugins
-- =======================================================================
-- Load plugins
require('plugins')

-- Auto compile when there are changes in `plugins.lua`.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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
