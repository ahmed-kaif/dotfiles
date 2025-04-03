return {
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
    vim.keymap.set('n', '<leader>run', ':RunCode<CR>', { desc = "Run Code", noremap = true, silent = false })
    vim.keymap.set('n', '<leader>b', ':RunCode<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
    end,

  },
}
