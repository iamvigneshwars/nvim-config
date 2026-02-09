return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    numbers = "ordinal",
                    diagnostics = "nvim_lsp",
                    separator_style = "slant",
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    max_name_length = 18,
                    max_prefix_length = 15,
                    truncate_names = true,
                    close_command = function(bufnum)
                        require("bufdelete").bufdelete(bufnum, true)
                    end,
                    right_mouse_command = "bdelete!",
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = "bdelete! %d",
                    hover = {
                        enabled = true,
                        delay = 100,
                        reveal = { "close" },
                    },
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer",
                            highlight = "Directory",
                            separator = true,
                        },
                    },
                },
            })

            local map = vim.keymap.set

            -- Buffer switching with leader + number (1-9)
            for i = 1, 9 do
                map("n", "<leader>" .. i, function()
                    require("bufferline").go_to(i, true)
                end, { desc = "Go to buffer " .. i })
            end

            -- Quick buffer navigation
            map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
            map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })

            -- Move buffers left/right
            map("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
            map("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })

            -- Pick buffer by letter (shows letters on each buffer)
            map("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })

            -- Pick buffer to close
            map("n", "<leader>bx", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })

            -- Close buffers
            map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
            map("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { desc = "Close buffers to right" })
            map("n", "<leader>bL", "<cmd>BufferLineCloseLeft<CR>", { desc = "Close buffers to left" })

            -- Go to first/last buffer
            map("n", "<leader>bf", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "First buffer" })
            map("n", "<leader>be", "<cmd>BufferLineGoToBuffer -1<CR>", { desc = "Last buffer" })
        end,
    },
    {
        "famiu/bufdelete.nvim",
        keys = {
            { "<leader>bd", "<cmd>Bdelete<CR>", desc = "Delete buffer" },
        },
    },
}
