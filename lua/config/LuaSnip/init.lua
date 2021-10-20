-- Utility functions for cmp and luasnip

local luasnip = require('luasnip')
local cmp = require("cmp")
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_next_item()
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return t "<Tab>"
    else
        cmp.complete()
    end
    return ""
end

_G.s_tab_complete = function()
    if cmp and cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    else
        return t "<S-Tab>"
    end
    return ""
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

--[[
-- Beside defining your own snippets you can also load snippets from "vscode-like" packages
-- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.
-- Mind that this will extend  `ls.snippets` so you need to do it after your own snippets or you
-- will need to extend the table yourself instead of setting a new one.
]]
-- [Method 1]
-- require("luasnip/loaders/from_vscode").lazy_load({ path = "./my-snippets" })

-- [Method 2]
-- require("luasnip/loaders/from_vscode").lazy_load()

--  [Method 3]
require("luasnip/loaders/from_vscode").load({
  paths = {
    "/Users/alanjui/.config/my-code/my-snippets",
    "./my-snippets",
    "~/.config/my-nvim/snips"
  }
})

-- [Method 4]
-- require("luasnip/loaders/from_vscode").load({
--   include = {"python", "django", "html", "htmldjango", "javascript"},
--   paths = {
--     "/Users/alanjui/.config/my-code/my-snippets",
--   }
-- })
