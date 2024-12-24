return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "lua",
                "c",
                "cpp",
                "vim",
                "vimdoc",
                "query",
                "java",
                "python",
                "javascript",
                "html",
                "typescript",
                "rust",
                "kotlin",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = false },
            auto_install = true,
        })
    end,
}
