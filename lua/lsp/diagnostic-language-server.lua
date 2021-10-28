-- diagnostic-language-server.lua
-- https://github.com/creativenull/diagnosticls-configs-nvim/blob/main/supported-linters-and-formatters.md

local dlsconfig = require('diagnosticls-configs')

-------------------------------------------------------------------------------------
-- Python
-------------------------------------------------------------------------------------
-- Linters
-- local flake = require('diagnosticls-configs.linters.flake')
-- local pylint = require('diagnosticls-configs.linters.pylint')
-- Formatters
-- local autopep8 = require('diagnosticls-configs.formatters.autopep8')
-- local black = require('diagnosticls-configs.formatters.black')

-------------------------------------------------------------------------------------
-- JavaScript / TypeScript
-------------------------------------------------------------------------------------
-- Linters
local eslint = require('diagnosticls-configs.linters.eslint')
local standard = require('diagnosticls-configs.linters.standard')
local ts_standard = require('diagnosticls-configs.linters.ts_standard')
-- Formatters
local prettier = require('diagnosticls-configs.formatters.prettier')
local prettier_standard = require('diagnosticls-configs.formatters.prettier_standard')
local ts_standard_fmt = require('diagnosticls-configs.formatters.ts_standard_fmt')

dlsconfig.setup({
	-- ['python'] = {
	-- 	linter = pylint,
	-- 	formatter = autopep8
	-- },
	['javascript'] = {
		linter = eslint,
		formatter = prettier
	},
	['javascriptreact'] = {
		-- Add multiple linters
		linter = { eslint, standard },
		-- Add multiple formatters
		formatter = { prettier, prettier_standard }
	},
	['typescript'] = {
		linter = eslint,
		formatter = prettier
	},
	['typescriptreact'] = {
		-- Add multiple linters
		linter = { eslint, ts_standard },
		-- Add multiple formatters
		formatter = { prettier, ts_standard_fmt }
	},
})
