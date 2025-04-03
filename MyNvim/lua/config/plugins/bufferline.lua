return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    -- after = "catppuccin",
    config = function()
      local bufferline = require("bufferline")
      require("bufferline").setup {
        options = {
          numbers = function(options)
            return string.format('%s', options.raise(options.ordinal))
          end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true -- use a "true" to enable the default, or set your own character
            }
          }
        },
        -- highlights = require("catppuccin.groups.integrations.bufferline").get()
      }
      vim.keymap.set({ 'n', 'i' }, '<A-b>', function() bufferline.pick() end,
      { silent = true, desc = 'Pick [B]uffer' })
      vim.keymap.set({ 'n' }, '<leader>bco',":BufferLineCloseOthers<CR>",
      { silent = true, desc = '[B]uffer [C]lose [O]thers' })
      vim.keymap.set({ 'n', 'i' }, '<A-n>', function() bufferline.cycle(1) end,
      { silent = true, desc = 'Cycle Buffer [N]ext' })
      vim.keymap.set({ 'n', 'i' }, '<A-p>', function() bufferline.cycle(-1) end,
      { silent = true, desc = 'Cycle Buffer [P]revious' })
      vim.keymap.set({ 'n', 'i' }, '<A-1>', function() bufferline.go_to(1, true) end,
      { silent = true, desc = 'Select Buffer [1]' })
      vim.keymap.set({ 'n', 'i' }, '<A-2>', function() bufferline.go_to(2, true) end,
      { silent = true, desc = 'Select Buffer [2]' })
      vim.keymap.set({ 'n', 'i' }, '<A-3>', function() bufferline.go_to(3, true) end,
      { silent = true, desc = 'Select Buffer [3]' })
      vim.keymap.set({ 'n', 'i' }, '<A-4>', function() bufferline.go_to(4, true) end,
      { silent = true, desc = 'Select Buffer [4]' })
      vim.keymap.set({ 'n', 'i' }, '<A-5>', function() bufferline.go_to(5, true) end,
      { silent = true, desc = 'Select Buffer [5]' })
      vim.keymap.set({ 'n', 'i' }, '<A-6>', function() bufferline.go_to(6, true) end,
      { silent = true, desc = 'Select Buffer [6]' })
      vim.keymap.set({ 'n', 'i' }, '<A-7>', function() bufferline.go_to(7, true) end,
      { silent = true, desc = 'Select Buffer [7]' })
      vim.keymap.set({ 'n', 'i' }, '<A-8>', function() bufferline.go_to(8, true) end,
      { silent = true, desc = 'Select Buffer [8]' })
      vim.keymap.set({ 'n', 'i' }, '<A-9>', function() bufferline.go_to(9, true) end,
      { silent = true, desc = 'Select Buffer [9]' })
      vim.keymap.set({ 'n', 'i' }, '<A-$>', function() bufferline.go_to(-1, true) end,
      { silent = true, desc = 'Select Last Buffer' })
    end
  },
}
