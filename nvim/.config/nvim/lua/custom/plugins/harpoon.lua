local M = {}
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = 'Add buffer to Harpoon' })
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon List' })

vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Select Harpoon 1' })
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Select Harpoon 2' })
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Select Harpoon 3' })
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Select Harpoon 4' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

return M
