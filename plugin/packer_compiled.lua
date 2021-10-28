-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/alanjui/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/alanjui/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/alanjui/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/alanjui/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/alanjui/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ale = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["bracey.vim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/bracey.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["diaglist.nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/diaglist.nvim"
  },
  ["diagnosticls-configs-nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/diagnosticls-configs-nvim"
  },
  ["emmet-ls"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/emmet-ls"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["open-browser.vim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plantuml-previewer.vim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/plantuml-previewer.vim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/plantuml-syntax"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["tabline.nvim"] = {
    config = { "\27LJ\1\2D\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\venable\1\nsetup\ftabline\frequire\0" },
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/tabline.nvim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gist"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-gist"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-instant-markdown"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-instant-markdown"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent"
  },
  ["vim-pythonsense"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-pythonsense"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vim-which-key"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/alanjui/.local/share/nvim/site/pack/packer/start/webapi-vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: tabline.nvim
time([[Config for tabline.nvim]], true)
try_loadstring("\27LJ\1\2D\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\venable\1\nsetup\ftabline\frequire\0", "config", "tabline.nvim")
time([[Config for tabline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
