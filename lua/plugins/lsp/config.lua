return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "j-hui/fidget.nvim",
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Fidget for LSP progress
        require("fidget").setup({
            progress = {
                display = {
                    done_icon = "",
                },
            },
            notification = {
                window = {
                    winblend = 0,
                },
            },
        })

        vim.diagnostic.config({
            virtual_text = { prefix = "" },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always",
            },
        })

        -- LSP keymaps (attached on LspAttach)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("gd", vim.lsp.buf.definition, "Go to Definition")
                map("gD", vim.lsp.buf.declaration, "Go to Declaration")
                map("gi", vim.lsp.buf.implementation, "Go to Implementation")
                map("gr", vim.lsp.buf.references, "Go to References")
                map("gt", vim.lsp.buf.type_definition, "Go to Type Definition")
                map("<leader>rn", vim.lsp.buf.rename, "Rename")
                map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("<leader>gf", vim.lsp.buf.format, "Format")
                map("<leader>ds", vim.diagnostic.open_float, "Show Diagnostics")
                map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
                map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
            end,
        })

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            pyright = {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            },
            ts_ls = {
                filetypes = {
                    "typescript",
                    "javascript",
                    "typescriptreact",
                    "javascriptreact",
                },
            },
            eslint = {
                settings = {
                    format = true,
                },
            },
            yamlls = {
                filetypes = { "yaml", "yaml.docker-compose" },
                settings = {
                    yaml = {
                        schemas = {
                            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
                            ["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
                        },
                        validate = true,
                        completion = true,
                        hover = true,
                    },
                },
            },
        }

        -- Disable rust_analyzer here (handled by rustaceanvim)
        vim.lsp.enable("rust_analyzer", false)

        for server, config in pairs(servers) do
            config.capabilities = capabilities
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end
    end,
}
