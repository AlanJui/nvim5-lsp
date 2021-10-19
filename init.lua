-- Default
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

g.python3_host_prog = "/home/alanjui/.pyenv/versions/venv-397/bin/python3"
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- Load plugins 
require('plugins')

-- Auto compile when there are changes in `plugins.lua`.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- nvim-lspconfig

-- bash LS
require('lspconfig').bashls.setup{}

-- Lua Language Server
require('lsp/lua')
