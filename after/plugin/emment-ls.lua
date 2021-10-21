-- emment-ls
local nvim_lsp = require('lspconfig')
local nvim_configs = require('lspconfig/configs')

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

capabilities.textDocument.completion.completionItem.snippetSupport = true

if not nvim_lsp.emmet_ls then
	nvim_configs.emmet_ls = {
		default_config = {
			cmd = {'emmet-ls', '--stdio'};
			filetypes = {'html', 'htmldjango', 'css'};
			root_dir = function (fname)
				return vim.loop.cwd()
			end;
			settings = {};
		};
	}
end
nvim_lsp.emmet_ls.setup{ capabilities = capabilities }

