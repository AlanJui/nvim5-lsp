-- diagnostic-languageserver
local nvim_lsp = require('lspconfig')
local on_attach = require('lsp.on_attach')
local keymap = require('utils.set_keymap')

nvim_lsp.diagnosticls.setup {
 	on_attach = on_attach,
	filetypes = {
		'javascript', 'javascriptreact', 'json',
		'typescript', 'typescriptreact',
		'css', 'less', 'scss',
		'markdown', 'pandoc'
	},
	init_options = {
		linters = {
			eslint = {
				command = 'eslint_d',
				rootPatterns = { '.git' },
				debounce = 100,
				args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
				sourceName = 'eslint_d',
				parseJson = {
					errorsRoot = '[0].messages',
					line = 'line',
					column = 'column',
					endLine = 'endLine',
					endColumn = 'endColumn',
					message = '[eslint] ${message} [${ruleId}]',
					security = 'severity'
				}
			},
		},
		filetypes = {
			javascript = 'eslint',
			javascriptreact = 'eslint',
			typescript = 'eslint',
			typescriptreact = 'eslint',
		},
		formatters = {
			eslint_d = {
				command = 'eslint_d',
				args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
				rootPatterns = { '.git' },
			},
			prettier = {
				command = 'prettier',
				args = { '--stdin-filepath', '%filename' }
			}
		},
		formatFiletypes = {
			css  = 'prettier',
			scss = 'prettier',
			less = 'prettier',
			json = 'prettier',
			markdown = 'prettier',
			javascript = 'eslint_d',
			javascriptreact = 'eslint_d',
			typescript = 'eslint_d',
			typescriptreact = 'eslint_d',
		}
	}
}

-- icon
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		-- This sets the spacing and the prefix, obviously.
		virtual_text = {
			spacing = 4,
			prefix = '',
		}
	}
)

-- set keymap
--[[
map("n", "<leader>ci", ":Lspsaga show_line_diagnostics<CR>", { silent = true })
map("n", "<leader>cn", ":Lspsaga diagnostic_jump_next<CR>", { silent = true })
map("n", "<leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", { silent = true })
]]
keymap('n', '<C-j>l', ':Lspsaga show_line_diagnostics<CR>', { silent = true })
keymap('n', '<C-j>n', ':Lspsaga diagnostic_jump_next<CR>', { silent = true })
keymap('n', '<C-j>p', ':Lspsaga diagnostic_jump_prev<CR>', { silent = true })
