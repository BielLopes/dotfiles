return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { },
        keys = {
            { '<leader>ff', "<cmd>:lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.95, height=0.9, prompt_position='top'}})<CR>",    desc = 'Find by file name' },
            { '<leader>fg', "<cmd>:lua require('telescope.builtin').live_grep({layout_strategy='vertical',layout_config={width=0.95, height=0.9, prompt_position='top'}})<CR>",    desc = 'Find by string match on all files' },
            { '<leader>fh', "<cmd>:lua require('telescope.builtin').oldfiles({layout_strategy='vertical',layout_config={width=0.95, height=0.9, prompt_position='top'}})<CR>",   desc = 'Recent searched files' },
        },
        config = function()
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end,
    },
}
