return {
    "LostbBlizzard/lazysql.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("lazysql").setup()
        vim.keymap.set("n", "<leader>ls", "<cmd>LazySql<CR>", { desc = "Toggle LazySql", noremap = true, silent = true })
    end
}
