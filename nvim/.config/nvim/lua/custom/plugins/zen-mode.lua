return {
    {
        "folke/zen-mode.nvim",
        keys = {
            { "<leader>z", ":ZenMode<CR>", silent = true, desc = "Toggle ZenMode" },
        },
        opts = {
            plugins = {
                -- disable some global vim options (vim.o...)
                -- comment the lines to not apply the options
                options = {
                    enabled = true,
                    ruler = false,   -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    -- you may turn on/off statusline in zen mode by setting 'laststatus'
                    -- statusline will be shown only if 'laststatus' == 3
                    laststatus = 0,            -- turn off the statusline in zen mode
                },
                twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
                gitsigns = { enabled = true }, -- disables git signs
                tmux = { enabled = false },    -- disables the tmux statusline
                todo = { enabled = false },    -- if set to "true", todo-comments.nvim highlights will be disabled
                -- this will change the font size on kitty when in zen mode
                -- to make this work, you need to set the following kitty options:
                -- - allow_remote_control socket-only
                -- - listen_on unix:/tmp/kitty
                kitty = {
                    enabled = true,
                    font = "+2", -- font size increment
                    background_opacity = 0.80,
                },
            },
            -- callback where you can add custom code when the Zen window opens
            on_open = function(win)
            end,
            -- callback where you can add custom code when the Zen window closes
            on_close = function()
            end,
        },
    }
}
