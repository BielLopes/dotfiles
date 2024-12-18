return {
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
            -- vim.cmd.colorscheme("catppuccin-mocha")  -- Set the desired Catppuccin flavor here
        end,
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            trasnparent = true,
        },
        -- config = function()
        --     vim.cmd.colorscheme("solarized-osaka")
        -- end
    },
}
