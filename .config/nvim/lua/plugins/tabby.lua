return {
    "nanozuki/tabby.nvim",
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<TAB>", "<cmd>:tabn<cr>",   desc = "Go to the Next tab" },
        { "<S-TAB>", "<cmd>:tabp<cr>", desc = "Go to the Previus tab" },
        { "<S-T>", "<cmd>:tabnew<cr>", desc = "Go to the Previus tab" },
    },
    config = function()
        -- configs...
        local theme = {
            fill = { fg='#f2e9de', bg='#907aa9', style='italic' },
            head = "TabLine",
            current_tab = "TabLineSel",
            tab = "TabLine",
            win = "TabLine",
            tail = "TabLine",
        }
        require("tabby").setup({
            line = function(line)
                return {
                    {
                        { "  ", hl = theme.head },
                        line.sep("", theme.head, theme.fill),
                    },
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and theme.current_tab or theme.tab
                        return {
                            line.sep("", hl, theme.fill),
                            tab.is_current() and "" or "󰆣",
                            tab.number(),
                            tab.name(),
                            tab.close_btn(""),
                            line.sep("", hl, theme.fill),
                            hl = hl,
                            margin = " ",
                        }
                    end),
                    line.spacer(),
                    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                        return {
                            line.sep("", theme.win, theme.fill),
                            win.is_current() and "" or "",
                            win.buf_name(),
                            line.sep("", theme.win, theme.fill),
                            hl = theme.win,
                            margin = " ",
                        }
                    end),
                    {
                        line.sep("", theme.tail, theme.fill),
                        { "  ", hl = theme.tail },
                    },
                    hl = theme.fill,
                }
            end,
            -- option = {}, -- setup modules' option,
        })
    end,
}
