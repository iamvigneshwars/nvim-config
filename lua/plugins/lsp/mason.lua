return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup({
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    -- rust_analyzer handled by rustaceanvim
                    "ts_ls",
                    "yamlls",
                    "eslint",
                },
                automatic_installation = true,
                handlers = {
                    -- Default handler
                    function(server_name)
                        -- Skip rust_analyzer, handled by rustaceanvim
                        if server_name == "rust_analyzer" then
                            return
                        end
                    end,
                },
            })
        end,
    },
}
