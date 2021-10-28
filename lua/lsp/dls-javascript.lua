-- dls-javascript.lua
-- JavaScript Language Server
-- Setup the linters/formatters according to the filetype
-- Running eslint and prettier for JavaScript and JavaScriptReact filetype
local dlsconfig = require('diagnosticls-configs')
local eslint = require('diagnosticls-configs.linters.eslint')
local standard = require('diagnosticls-configs.linters.standard')
local prettier = require('diagnosticls-configs.formatters.prettier')
local prettier_standard = require('diagnosticls-configs.formatters.prettier_standard')

dlsconfig.setup({
	['javascript'] = {
		linter = eslint,
		formatter = prettier
	},
	['javascriptreact'] = {
		-- Add multiple linters
		linter = { eslint, standard },
		-- Add multiple formatters
		formatter = { prettier, prettier_standard }
	}
})
