return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            local node_path = "/dls/science/users/mrg27357/bin/node"
            local opts = {
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
            }
            if vim.fn.executable(node_path) == 1 then
                opts.copilot_node_command = node_path
            end
            require("copilot").setup(opts)
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
        keys = {
            { "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
            { "<leader>ce", "<cmd>CopilotChatExplain<CR>", desc = "Explain code" },
            { "<leader>cf", "<cmd>CopilotChatFix<CR>", desc = "Fix code" },
            { "<leader>co", "<cmd>CopilotChatOptimize<CR>", desc = "Optimize code" },
        },
        opts = {
            debug = false,
            show_help = true,
        },
    },
}
