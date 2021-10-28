-- diagnosticls-configs-nvim.lua

local function on_attach(client)
	print('Attached to ' .. client.name)
end

local dlsconfig = require('diagnosticls-configs')

dlsconfig.init({
	on_attach = on_attach,
})
