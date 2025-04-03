require("config.options")
require("config.lazy")
require("config.keymaps")

-- Highlight when yanking text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function ()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function ()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
