-- lspkind.lua

require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or

    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})


-- lspkind.init({
-- 	-- enables text annotations
-- 	with_text = true,
--
-- 	-- default symbol map
-- 	preset = 'codicons',
--
-- 	-- symbols for autocomplete
-- 	symbol_map = {
-- 		Text = "   (Text) ",
-- 		Method = "   (Method)",
-- 		Function = "   (Function)",
-- 		Constructor = "   (Constructor)",
-- 		Field = " ﴲ  (Field)",
-- 		Variable = "[] (Variable)",
-- 		Class = "   (Class)",
-- 		Interface = " ﰮ  (Interface)",
-- 		Module = "   (Module)",
-- 		Property = " 襁 (Property)",
-- 		Unit = "   (Unit)",
-- 		Value = "   (Value)",
-- 		Enum = " 練 (Enum)",
-- 		Keyword = "   (Keyword)",
-- 		Snippet = "   (Snippet)",
-- 		Color = "   (Color)",
-- 		File = "   (File)",
-- 		Reference = "   (Reference)",
-- 		Folder = "   (Folder)",
-- 		EnumMember = "   (EnumMember)",
-- 		Constant = " ﲀ  (Constant)",
-- 		Struct = " ﳤ  (Struct)",
-- 		Event = "   (Event)",
-- 		Operator = "   (Operator)",
-- 		TypeParameter = "   (TypeParameter)",
-- 	},
-- })
