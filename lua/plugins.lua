-- This file can be loaded by calling `lua require('plugin_name')
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- ===========================================================
  -- Essential
  -- ===========================================================
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
	use 'kabouzeid/nvim-lspinstall'
	use 'onsails/lspkind-nvim'
	use 'onsails/diaglist.nvim'
  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
	-- Snippet for vim-vsnip
  use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
  use 'hrsh7th/cmp-vsnip'
	use 'rafamadriz/friendly-snippets'
  -- Snippet for LuaSnip
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
	-- LSP UI Tools
	use 'glepnir/lspsaga.nvim'

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- Toggle comments in Neovim
  use 'terrortylor/nvim-comment'
  -- causes all trailing whitespace characters to be highlighted
  use 'ntpeters/vim-better-whitespace'
  -- Auto close parentheses and repeat by dot dot dot...
  use 'jiangmiao/auto-pairs'

  -- ===========================================================
  -- User Interface
  -- ===========================================================
  -- Status Line
  -- use 'itchyny/lightline.vim' -- Fancier statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
