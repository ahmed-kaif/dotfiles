-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local set = vim.keymap.set

set("n", "<localleader>pi", "<CMD>Pioinit<CR>")
set("n", "<localleader>pr", "<CMD>Piorun<CR>")
set("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false })
set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
-- set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
-- set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })
