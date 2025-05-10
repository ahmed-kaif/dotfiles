return {
  "anurag3301/nvim-platformio.lua",
  dependencies = {
    { "akinsho/nvim-toggleterm.lua" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  cmd = {
    "Pioinit",
    "Piorun",
    "Piocmd",
    "Piolib",
    "Piomon",
    "Piodebug",
    "Piodb",
  },
  config = function()
    require("platformio").setup({
      lsp = "clangd", --default: ccls, other option: clangd
      -- If you pick clangd, it also creates compile_commands.json
    })
  end,
  keys = {
    { "n", "<localleader>pi", "<cmd>Pioinit<cr>", silent = true, desc = "Platformio project init" },
  },
}
