return {
    -- Window picker for neo-tree and other plugins
    {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        version = "2.*",
        event = "VeryLazy",
        config = function()
            require("window-picker").setup({
                hint = "floating-big-letter",
                filter_rules = {
                    include_current_win = false,
                    bo = {
                        filetype = { "neo-tree", "neo-tree-popup", "notify" },
                        buftype = { "terminal", "quickfix" },
                    },
                },
            })
        end,
    },

    -- Which-key for keybinding help
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup({
                delay = 300,
            })
            wk.add({
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>h", group = "Hunk/Git" },
                { "<leader>c", group = "Copilot/Code" },
                { "<leader>r", group = "Refactor/Rust" },
                { "<leader>s", group = "Split" },
                { "<leader>t", group = "Tab/Terminal" },
                { "<leader>b", group = "Buffer" },
                { "<leader>u", group = "UI/Theme" },
            })
        end,
    },

    -- Comment.nvim for easy commenting
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
}
