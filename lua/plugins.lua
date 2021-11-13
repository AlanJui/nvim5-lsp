-- plugins.lua
-- This file can be loaded by calling `lua require('plugin_name')
local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
local is_empty = require('utils.is_empty')
local home_path = os.getenv('HOME')

local my_nvim
local nvim_config_path
local package_root
local compile_path
local install_path

my_nvim = os.getenv('MY_NVIM')
if is_empty(my_nvim) then
    my_nvim = 'nvim'
    nvim_config_path = home_path .. '/.config/' .. my_nvim
    package_root = home_path .. '/.local/share/' .. my_nvim .. '/site/pack'
else
    nvim_config_path = os.getenv('NVIM_CONFIG_DIR')
    package_root = os.getenv('NVIM_RUNTIME_DIR') .. '/site/pack'
end
compile_path = nvim_config_path .. '/plugin/packer_compiled.lua'
install_path = package_root .. '/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Auto compile when there are changes in `plugins.lua`.
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

-- Inital package root dir and compiled path
require('packer').init({
    package_root = package_root,
    compile_path = compile_path,
})

-- Install Plugins
local use = require('packer').use
require('packer').startup({ function()
    -- ===========================================================
    -- Essential
    -- ===========================================================
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Neovim Language Server Protocol
    ---------------------------------------------------------------
    -- Collection of configurations for built-in LSP client
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }
    use {
        'creativenull/diagnosticls-configs-nvim',
        requires = { 'neovim/nvim-lspconfig'}
    }
    use 'onsails/lspkind-nvim'
    -- use 'onsails/diaglist.nvim'
    -- LSP UI Tools
    use 'glepnir/lspsaga.nvim'
    -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Snippet for vim-vsnip
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    -- Snippet for LuaSnip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    -- Snippets
    use 'rafamadriz/friendly-snippets'

    -- Editting Tools
    ---------------------------------------------------------------
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    -- Toggle comments in Neovim
    use 'terrortylor/nvim-comment'
    -- causes all trailing whitespace characters to be highlighted
    use 'ntpeters/vim-better-whitespace'
    -- Add indentation quides even on blank lines
    use 'lukas-reineke/indent-blankline.nvim'
    -- Auto close parentheses and repeat by dot dot dot...
    use 'jiangmiao/auto-pairs'
    -- "surroundings": parentheses, brackets, quotes, XML tags, and more
    use 'tpope/vim-surround'
    -- Multiple cursor editting
    use 'mg979/vim-visual-multi'
    -- visualizes undo history and makes it easier to browse and switch between different undo branches
    use 'mbbill/undotree'

    -- Find files
    ---------------------------------------------------------------
    -- Fuzzy file finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- File/Flolders explorer:nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }

    -- Python
    ---------------------------------------------------------------
    -- ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax
    -- checking and semantic errors) in NeooVim while you edit your text files,
    -- and acts as a Vim Language Server Protocol client.
    use 'dense-analysis/ale'
    --  Modifies Vim’s indentation behavior to comply with PEP8 and my aesthetic preferences.
    use 'Vimjas/vim-python-pep8-indent'
    -- Python: provides text objects and motions for Python classes, methods,
    -- functions and doc strings
    use 'jeetsukumaran/vim-pythonsense'
    -- View and search LSP symbols, tags in NeoVim
    use 'liuchengxu/vista.vim'

    -- HTML
    ---------------------------------------------------------------
    -- Auto change html tags
    use 'AndrewRadev/tagalong.vim'
    --use 'alvan/vim-closetag'
    use 'windwp/nvim-ts-autotag'
    -- provides support for expanding abbreviations similar to emmet
    use 'mattn/emmet-vim'
    -- use 'aca/emmet-ls'

    -- ===========================================================
    -- Git Tools
    -- ===========================================================
    -- Add git related info in the signs columns and popups
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function ()
            require('gitsigns').setup()
        end
    }
    -- Git commands in nvim
    use 'tpope/vim-fugitive'
    -- Fugitive-companion to interact with github
    use 'tpope/vim-rhubarb'
    -- A work-in-progress Magit clone for Neovim that is geared toward the Vim philosophy.
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    -- for creating gist
    use 'mattn/webapi-vim'
    use 'mattn/vim-gist'

    -- ===========================================================
    -- User Interface
    -- ===========================================================
    -- Icon
    use {
        'yamatsum/nvim-web-nonicons',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    -- Status Line
    -- use 'itchyny/lightline.vim' -- Fancier statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'kdheepak/tabline.nvim',
        config = function ()
            require('tabline').setup({ enable = false })
        end,
        require = {
            'hoob3rt/lualine.nvim',
            'kyazdani42/nvim-web-devicons'
        }
    }
    -- Screnn Navigation
    -- use 'glepnir/dashboard-nvim'
    use 'liuchengxu/vim-which-key'

    -- ===========================================================
    -- Misc.
    -- ===========================================================
    -- Automatic tags management
    use 'ludovicchabant/vim-gutentags'
    -- Terminal
    use 'voldikss/vim-floaterm'
    -- highlight your todo comments in different styles
    use 'folke/todo-comments.nvim'
    -- Live server
    use 'turbio/bracey.vim'
    -- Markdown preview
    use 'instant-markdown/vim-instant-markdown'
    -- PlantUML
    use 'weirongxu/plantuml-previewer.vim'
    use 'tyru/open-browser.vim'
    -- PlantUML syntax highlighting
    use 'aklt/plantuml-syntax'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end})
