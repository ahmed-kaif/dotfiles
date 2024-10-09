local M = {}
local bufferline = require("bufferline")

vim.keymap.set({ 'n', 'i' }, '<A-b>', function() bufferline.pick() end, { silent = true, desc = 'Pick Buffer' })
vim.keymap.set({ 'n', 'i' }, '<A-n>', function() bufferline.cycle(1) end, { silent = true, desc = 'Cycle Buffer Next' })
vim.keymap.set({ 'n', 'i' }, '<A-p>', function() bufferline.cycle(-1) end,
    { silent = true, desc = 'Cycle Buffer Previous' })
vim.keymap.set({ 'n', 'i' }, '<A-1>', function() bufferline.go_to(1, true) end,
    { silent = true, desc = 'Select Buffer 1' })
vim.keymap.set({ 'n', 'i' }, '<A-2>', function() bufferline.go_to(2, true) end,
    { silent = true, desc = 'Select Buffer 2' })
vim.keymap.set({ 'n', 'i' }, '<A-3>', function() bufferline.go_to(3, true) end,
    { silent = true, desc = 'Select Buffer 3' })
vim.keymap.set({ 'n', 'i' }, '<A-4>', function() bufferline.go_to(4, true) end,
    { silent = true, desc = 'Select Buffer 4' })
vim.keymap.set({ 'n', 'i' }, '<A-5>', function() bufferline.go_to(5, true) end,
    { silent = true, desc = 'Select Buffer 5' })
vim.keymap.set({ 'n', 'i' }, '<A-6>', function() bufferline.go_to(6, true) end,
    { silent = true, desc = 'Select Buffer 6' })
vim.keymap.set({ 'n', 'i' }, '<A-7>', function() bufferline.go_to(7, true) end,
    { silent = true, desc = 'Select Buffer 7' })
vim.keymap.set({ 'n', 'i' }, '<A-8>', function() bufferline.go_to(8, true) end,
    { silent = true, desc = 'Select Buffer 8' })
vim.keymap.set({ 'n', 'i' }, '<A-9>', function() bufferline.go_to(9, true) end,
    { silent = true, desc = 'Select Buffer 9' })
vim.keymap.set({ 'n', 'i' }, '<A-$>', function() bufferline.go_to(-1, true) end,
    { silent = true, desc = 'Select Last Buffer' })


return M
