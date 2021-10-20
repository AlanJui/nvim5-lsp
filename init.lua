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

-- nvim-lspconfig

-- bash LS
require('lspconfig').bashls.setup{}

-- Lua Language Server
require('lsp/lua')

-- #############################################################################

-- nvim-cmp
local nvim_lsp = require('lspconfig')

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- =======================================================================
-- Plugins Confiugration
-- =======================================================================
require('nvim_comment').setup()

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

-- Display Line Number
vim.cmd([[ set number relativenumber ]])

-- Disable line wrap
vim.opt.textwidth=0
vim.opt.wrapmargin=0

