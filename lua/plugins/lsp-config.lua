return {
    -- Mason
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    -- Tree sitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = { "lua", "python", "rust", "vim", "markdown", "typescript", "javascript", "tsx" },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "ts_ls" }
            })
        end
    },
    -- Autocompletion plugin
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",       -- Buffer completions
            "hrsh7th/cmp-path",         -- Path completions
            "hrsh7th/cmp-cmdline",      -- Command line completions
            "L3MON4D3/LuaSnip",         -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Luasnip completion source
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                filetypes = { "python" }
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "typescript.tsx", "javascript.jsx" },
                cmd = { "typescript-language-server", "--stdio" }
            })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        end
    },
    -- None LS
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.diagnostics.eslint,
                    null_ls.builtins.completion.spell,
                },
            })
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end,
    },
    -- Auto-pairs plugin
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
                ts_config = {
                    lua = { 'string' },
                    javascript = { 'template_string' },
                    typescript = { 'template_string' },
                }
            })
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end
    },
    -- Rust Tools for enhanced Rust development
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            local rt = require("rust-tools")
            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        rt.inlay_hints.enable()
                        vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                        vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
                        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
                        vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
                    end,
                    settings = {
                        ["rust-analyzer"] = {
                            inlayHints = {
                                enable = true,
                                chainingHints = {
                                    enable = true,
                                },
                                maxLength = 25,
                                parameterHints = {
                                    enable = true,
                                },
                                typeHints = {
                                    enable = true,
                                },
                                implicitDrops = {
                                    enable = true,
                                },
                                bindingModeHints = {
                                    enable = true,
                                },
                            },
                            checkOnSave = {
                                command = "clippy"
                            },
                            procMacro = {
                                enable = true
                            },
                            cargo = {
                                loadOutDirsFromCheck = true,
                                allFeatures = true,
                            },
                        }
                    },
                },
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    },
                },
            })
        end
    }
}
