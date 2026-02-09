return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
    },
    keys = {
        { "<C-n>", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
        { "<leader>e", "<cmd>Neotree focus<CR>", desc = "Focus Neo-tree" },
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            default_component_configs = {
                indent = {
                    padding = 1,
                    with_expanders = true,
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                },
                git_status = {
                    symbols = {
                        added = "",
                        modified = "",
                        deleted = "",
                        renamed = "",
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
            window = {
                position = "left",
                width = 35,
                mappings = {
                    ["<space>"] = "none",
                    ["l"] = "open",
                    ["h"] = "close_node",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        "node_modules",
                        "__pycache__",
                        ".git",
                    },
                },
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },
            buffers = {
                follow_current_file = {
                    enabled = true,
                },
            },
        })
    end,
}
