local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("python", {
	s("fn", {
		t("def "), i(1, "function_name"), t("("), i(2, "args"), t({ "):", "\t" }),
		i(0)
	}),
	s("imp", {
		t("import "), i(1, "module_name")
	}),
})
