return {
    {
        "michaelrommel/nvim-silicon",
        lazy = true,
        cmd = "Silicon",
        config = function()
            require("nvim-silicon").setup({
                -- Configuration here, or leave empty to use defaults
                font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
                theme = "Monokai Extended",
                to_clipboard = true,
                window_title = function()
                    return vim.fn.fnamemodify(
                        vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
                        ":t"
                    )
                end,
            })
        end
    }
}
