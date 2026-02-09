return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "truncate" },
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                        },
                        width = 0.87,
                        height = 0.80,
                    },
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<Esc>"] = actions.close,
                        },
                    },
                    file_ignore_patterns = {
                        "node_modules",
                        ".git/",
                        "target/",
                        "dist/",
                        "__pycache__/",
                        "%.pyc",
                        "%.lock",
                        "%.sum",
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob=!.git/",
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
                    },
                    live_grep = {
                        additional_args = function()
                            return { "--hidden" }
                        end,
                    },
                    grep_string = {
                        additional_args = function()
                            return { "--hidden" }
                        end,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            -- Load extensions
            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")

            -- Keymaps
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
            vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
            vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
            vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
            vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Workspace symbols" })
        end,
    },
}
