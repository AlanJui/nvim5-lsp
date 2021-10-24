-- lualine.lua
--
-- Lualine has sections as shown below.
-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+

require('lualine').setup{
	-- options = { theme = 'jellybeans' }
  options = {
    icons_enabled = true,
		theme = 'material',
    -- section_separators = {'', ''},
    -- component_separators = {'', ''},
    -- disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {
      {
				'diagnostics',
				sources = {"nvim_lsp"},
				symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}
			},
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
	tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require('tabline').tabline_buffers },
    lualine_x = { require('tabline').tabline_tabs },
    lualine_y = {},
    lualine_z = {}
	},
  extensions = {'fugitive'}
}

-- vim.cmd([[
-- function MyTabLine()
--   let s = ''
--   for i in range(tabpagenr('$'))
--     " select the highlighting
--     if i + 1 == tabpagenr()
--       let s .= '%#TabLineSel#'
--     else
--       let s .= '%#TabLine#'
--     endif
--     " set the tab page number (for mouse clicks)
--     let s .= '%' . (i + 1) . 'T'
--     " the label is made by MyTabLabel()
--     let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
--     if i + 1 == tabpagenr()
--       let s .= '%#TabLineSep#ÓÇ∞'
--     elseif i + 2 == tabpagenr()
--       let s .= '%#TabLineSep2#ÓÇ∞'
--     else
--       let s .= 'ÓÇ±'
--     endif
--   endfor
--   " after the last tab fill with TabLineFill and reset tab page nr
--   let s .= '%#TabLineFill#%T'
--   " right-align the label to close the current tab page
--   if tabpagenr('$') > 1
--     let s .= '%=%#TabLine#%999X'
--   endif
--   return s
-- endfunction
--
-- function MyTabLabel(n)
--   let buflist = tabpagebuflist(a:n)
--   let winnr = tabpagewinnr(a:n)
--   let name = bufname(buflist[winnr - 1])
--   let label = fnamemodify(name, ':t')
--   return len(label) == 0 ? '[No Name]' : label
-- endfunction
--
-- set tabline=%!MyTabLine()
-- ]])
