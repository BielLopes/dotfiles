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
    end,

}
