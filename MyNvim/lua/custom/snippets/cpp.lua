local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  s("template", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "int main() {",
      "",
    }),
    i(0),
    t({
      "",
      "  return 0;",
      "}"
    }),
  }),
  s("template testcase", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "int main() {",
      "  int t;",
      "  cin >> t;",
      "  while(t--) {",
      "    ",
    }),
    i(0),
    t({
      "",
      "  }",
      "  return 0;",
      "}"
    }),
  }),
  -- end add_snippets function
})
