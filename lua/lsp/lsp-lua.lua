-- Lua LS
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = os.getenv('HOME') ..
														'/~.local/share/nvim/lsp_servers/sumneko_lua/extensions/server/bin/'
local sumneko_binary = ''
local USER_OS = ''

if vim.fn.has("mac") == 1 then
		USER_OS = 'macOS'
elseif vim.fn.has("unix") == 1 then
		USER_OS = 'Linux'
else
    print("Unsupported system for sumneko")
		return
end


sumneko_root_path = sumneko_root_path .. USER_OS
sumneko_binary = sumneko_root_path .. '/lua-language-server'


require'lspconfig'.sumneko_lua.setup({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
									[vim.fn.expand('$VIMRUNTIME/lua')] = true,
									[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
								},
								-- Adjust these two values if your performance is not optimal
				-- 			maxPreload = 2000,
				-- 			preloadFileSize = 1000
            }
        }
    }
})
