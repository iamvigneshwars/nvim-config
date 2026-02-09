return {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    config = function()
        vim.g.rustaceanvim = {
            tools = {
                hover_actions = {
                    auto_focus = true,
                },
            },
            server = {
                on_attach = function(_, bufnr)
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "Rust: " .. desc })
                    end

                    map("K", function()
                        vim.cmd.RustLsp({ "hover", "actions" })
                    end, "Hover Actions")
                    map("<leader>ca", function()
                        vim.cmd.RustLsp("codeAction")
                    end, "Code Actions")
                    map("<leader>rr", function()
                        vim.cmd.RustLsp("runnables")
                    end, "Runnables")
                    map("<leader>rd", function()
                        vim.cmd.RustLsp("debuggables")
                    end, "Debuggables")
                    map("<leader>re", function()
                        vim.cmd.RustLsp("expandMacro")
                    end, "Expand Macro")
                    map("<leader>rc", function()
                        vim.cmd.RustLsp("openCargo")
                    end, "Open Cargo.toml")
                    map("<leader>rp", function()
                        vim.cmd.RustLsp("parentModule")
                    end, "Parent Module")
                    map("<leader>rj", function()
                        vim.cmd.RustLsp("joinLines")
                    end, "Join Lines")
                end,
                default_settings = {
                    ["rust-analyzer"] = {
                        inlayHints = {
                            enable = true,
                            chainingHints = { enable = true },
                            parameterHints = { enable = true },
                            typeHints = { enable = true },
                        },
                        checkOnSave = true,
                        check = {
                            command = "clippy",
                        },
                        procMacro = { enable = true },
                        cargo = {
                            loadOutDirsFromCheck = true,
                            allFeatures = true,
                        },
                    },
                },
            },
        }
    end,
}
