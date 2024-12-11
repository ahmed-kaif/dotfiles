local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("asm", { -- "asm" is the filetype for assembly code in Neovim
	s("template", {
		t({
			".model small",
			".stack 100h",
			".data",
			"",
			".code",
			"main proc",
			"    mov ax,@data",
			"    mov ds,ax ",
			"",
			"    mov ah,4ch",
			"    int 21h",
			"main endp",
			"end main",
		}),
		t({ "", "" }),
		i(0) -- Final cursor position
	}),
	s("datainit", {
		t({
			"mov ax,@data",
			"mov ds,ax",
		}),
	}),
	s("input", {
		t({
			"mov ah,1h",
			"int 21h",
		}),
	}),
	s("output", {
		t({
			"mov ah,2h",
			"mov dl,",
		}),
		i(1, "char"),
		t({ "",
			"int 21h", }),
		i(0)
	}),
	s("exit", {
		t({
			"mov ah,4ch",
			"int 21h"
		}),
	}),
})
