-- emmet-ls.lua

local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local util = require'lspconfig/util'

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_language_server then
  configs.emmet_language_server = {
    default_config = {
      cmd = {'emmet-language-server', '--stdio'};
      filetypes = {'html', 'htmldjango', 'css'};
      root_dir = util.root_pattern('package.json', '.git'),
      settings = {};
    };
  }
end
lspconfig.emmet_ls.setup{ capabilities = capabilities; }

-- vim.g.completion_trigger_character = { '.' }
vim.cmd([[
let g:completion_trigger_character = ['.']
]])

-- if not lspconfig.emmet_ls then
--   configs.emmet_ls = {
--     default_config = {
--       cmd = {'emmet-ls', '--stdio'};
--       filetypes = {'html', 'htmldjango', 'css'};
--       root_dir = function(fname)
--         return vim.loop.cwd()
--       end;
--       settings = {};
--     };
--   }
-- end
