return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<c-t>]],
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
        -- Run cargo test on terminal
        vim.keymap.set("n", "<leader>ct", function()
            vim.cmd("ToggleTerm")
            -- Send the command to the default terminal
            vim.cmd("TermExec cmd='cargo test'")
        end)
        -- Run Harlequin on custom terminal
        local Terminal = require("toggleterm.terminal").Terminal
        local sil_harlenquin = Terminal:new({
            cmd =
            "harlequin --adapter postgres --host localhost --port 5432 -U admin --password admin --dbname sil-versao-nova",
            hidden = false,
        })

        vim.keymap.set("n", "<leader>sh", function()
            sil_harlenquin:toggle()
        end)
    end,
}
