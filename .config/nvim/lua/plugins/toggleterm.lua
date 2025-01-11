return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<c-\>]],
            direction = "float",
            close_on_exit = true,
            float_opts = {
                border = "curved",
                title_pos = "center",
            },
        })

        -- Custom commands
        -- Run cargo run on terminal
        vim.keymap.set("n", "<leader>cr", function()
            vim.cmd("ToggleTerm")
            -- Send the command to the default terminal
            vim.cmd("TermExec cmd='cargo run'")
        end)


    end,
}
