-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set

set("n", "<localleader>pi", "<CMD>Pioinit<CR>")
set("n", "<localleader>pr", "<CMD>Piorun<CR>")
