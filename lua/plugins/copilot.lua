return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<C-y>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
                panel = { enabled = true },
                filetypes = {
                    ["*"] = true,
                },
            })
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
        opts = {
            debug = false,
            show_help = true,
            prompts = {
                Explain = {
                    prompt = "Explain how this code works.",
                },
                FixCode = {
                    prompt = "Fix this code to work as intended.",
                },
                Optimize = {
                    prompt = "Optimize this code for better performance.",
                },
            },
        },
        config = function(_, opts)
            require("CopilotChat").setup(opts)
            vim.keymap.set("n", "<leader>cc", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
            vim.keymap.set("n", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Copilot Chat Explain" })
            vim.keymap.set("n", "<leader>cf", ":CopilotChatFix<CR>", { desc = "Copilot Chat Fix" })
        end,
    }
}
