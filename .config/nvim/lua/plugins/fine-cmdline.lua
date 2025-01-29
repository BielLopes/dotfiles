return {
    "VonHeikemen/fine-cmdline.nvim", -- Plugin to execut commands on a floating UI
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { ":", "<cmd>FineCmdline<CR>", desc = "Toggle fine-cmdline" },
    },
}
