-- Python 環境 Lintting 與 Formatting 用 Diagnostic Language Server

local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local on_attach = require('lsp.on_attach')

-- Add additional capabilities supported by nvim-cmp
local capabilities = protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

nvim_lsp.flow.setup({
  on_attach = on_attach
})

nvim_lsp.pyright.setup({
  on_attach = on_attach,
	capabilities = capabilities,
	flags = { debounce_text_changes = 150, },
  filetypes = {
		'python',
  },
})

-- Setup diagnostics formaters and linters for non LSP provided files
nvim_lsp.diagnosticls.setup({
  on_attach = on_attach,
  filetypes = {
		'python',
	},
  init_options = {
		linters = {
			pylint = {
				sourceName = "pylint",
				command = "pylint",
				args = {
					"--output-format",
					"text",
					"--score",
					"no",
					"--msg-template",
					"'{line}:{column}:{category}:{msg} ({msg_id}:{symbol})'",
					"%file"
				},
				formatPattern = {
					"^(\\d+?):(\\d+?):([a-z]+?):(.*)$",
					{
						line     = 1,
						column   = 2,
						security = 3,
						message  = 4,
					}
				},
				rootPatterns = {
					".git",
					"pyproject.toml",
					"setup.py",
				},
				securities = {
					informational = "hint",
					refactor      = "info",
					convention    = "info",
					warning       = "warning",
					error         = "error",
					fatal         = "error",
				},
				offsetColumn = 1,
				formatLines  = 1,
			}
		}
  }
})

