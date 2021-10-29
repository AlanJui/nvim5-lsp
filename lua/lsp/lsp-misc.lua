-- misc-ls.lua

-- Python / TypeScript / C && C++
-- -----------------------------------------------------------------------
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local on_attach = require('lsp.on_attach')

-- Add additional capabilities supported by nvim-cmp
local capabilities = protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
  })
end
