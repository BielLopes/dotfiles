return {
    {
        "ldelossa/nvim-dap-projects",
        config = function()
            require("nvim-dap-projects").config_paths = { "./.nvim-dap.lua" }
            require("nvim-dap-projects").search_project_config()
        end,
    },
}
