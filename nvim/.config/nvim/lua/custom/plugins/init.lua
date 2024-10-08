-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons',
      'BlakeJC94/alpha-nvim-fortune' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = "v7.0.0",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require('code_runner').setup({
        term = {
          size = 15,
        },
        filetype = {
          java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt"
          },
          c = function(...)
            local c_base = {
              "cd $dir &&",
              "gcc $fileName -o",
              "$fileNameWithoutExt",
            }
            local c_exec = {
              "&& $dir/$fileNameWithoutExt &&",
              "rm $dir/$fileNameWithoutExt",
            }

            require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))

            --NOTE: If you want to add args then uncomment this code

            -- vim.ui.input({ prompt = "Add more args:" }, function(input)
            --   c_base[4] = input
            --   vim.print(vim.tbl_extend("force", c_base, c_exec))
            --   require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
            -- end)
          end,
          cpp = function(...)
            local cpp_base = {
              "cd $dir &&",
              "g++ $fileName -o",
              "$fileNameWithoutExt",
            }
            local cpp_exec = {
              "&& $dir/$fileNameWithoutExt &&",
              "rm $dir/$fileNameWithoutExt",
            }

            require("code_runner.commands").run_from_fn(vim.list_extend(cpp_base, cpp_exec))
          end,
          -- NOTE: Simpler version of CPP run commands

          -- cpp = {
          --   "cd $dir &&",
          --   "g++ $fileName -o $fileNameWithoutExt &&",
          --   "$dir/$fileNameWithoutExt"
          -- },
          python = "python3 -u",
          typescript = "deno run",
          rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt"
          },
          lua = {
            "cd $dir &&",
            "lua $filename"
          }
        },
      })
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    after = "catppuccin",
    config = function()
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
        highlights = require("catppuccin.groups.integrations.bufferline").get()
      }
    end
  },
  {
    'frabjous/knap',
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}
