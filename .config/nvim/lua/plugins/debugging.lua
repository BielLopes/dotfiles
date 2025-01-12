return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "codelldb",
                    "cpptools",
                },
            })
        end,
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup({})
            require("nvim-dap-virtual-text").setup()

            vim.keymap.set("n", "<F5>", function()
                dap.continue()
            end)
            vim.keymap.set("n", "<F10>", function()
                dap.step_over()
            end)
            vim.keymap.set("n", "<F11>", function()
                dap.step_into()
            end)
            vim.keymap.set("n", "<F12>", function()
                dap.step_out()
            end)
            vim.keymap.set("n", "<Leader>b", function()
                dap.toggle_breakpoint()
            end)
            vim.keymap.set("n", "<Leader>B", function()
                dap.set_breakpoint()
            end)
            vim.keymap.set("n", "<Leader>lp", function()
                dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
            end)
            vim.keymap.set("n", "<Leader>dr", function()
                dap.repl.open()
            end)
            vim.keymap.set("n", "<Leader>dl", function()
                dap.run_last()
            end)
            vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
                require("dap.ui.widgets").hover()
            end)
            vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
                require("dap.ui.widgets").preview()
            end)
            vim.keymap.set("n", "<Leader>df", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.frames)
            end)
            vim.keymap.set("n", "<Leader>ds", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes)
            end)

            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            -- Configuring specific debuggers
            -- lldb
            dap.adapters.lldb = {
                type = "executable",
                command = "/usr/bin/lldb-dap", -- adjust as needed, must be absolute path
                name = "lldb",
            }
            -- Rust
            local projecct_name = vim.fn.getcwd():match("([^/]+)$")
            dap.configurations.rust = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = function()
                        return vim.fn.getcwd() .. "/target/debug/" .. projecct_name
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                    runInTerminal = false,
                },
            }
            -- C
            dap.configurations.c = dap.configurations.rust
            -- C++
            dap.configurations.cpp = dap.configurations.rust
            -- Java
            -- dap.configurations.java = {
            --     {
            --         -- You need to extend the classPath to list your dependencies.
            --         -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
            --         classPaths = {},
            --
            --         -- If using multi-module projects, remove otherwise.
            --         projectName = "yourProjectName",
            --
            --         javaExec = "/path/to/your/bin/java",
            --         mainClass = "your.package.name.MainClassName",
            --
            --         -- If using the JDK9+ module system, this needs to be extended
            --         -- `nvim-jdtls` would automatically populate this property
            --         modulePaths = {},
            --         name = "Launch YourClassName",
            --         request = "launch",
            --         type = "java",
            --     },
            -- }
            -- Python
            dap.adapters.python = {
                type = "executable",
                command = "python",
                args = { "-m", "debugpy.adapter" },
            }
        end,
    },
}
