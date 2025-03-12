return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup {
                options = {
                    numbers = "ordinal",
                    diagnostics = "nvim_lsp",
                    separator_style = "slant",
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    tab_style = "separator",
                    tabs_color = {
                        active = { bg = "#5F87AF", fg = "#FFFFFF" },
                        inactive = { bg = "#2D3B45" }
                    },
                    buffer_color = {
                        active = { bg = "#3E4452" },
                        inactive = { bg = "#2E3440" }
                    },
                    close_command = function(bufnum) require('bufdelete').bufdelete(bufnum, true) end,
                    right_mouse_command = "bdelete!",
                    left_mouse_command = "buffer %d",
                    middle_mouse_command = "bdelete! %d",
                    hover = {
                        enabled = true,
                        delay = 100,
                        reveal = { 'close' }
                    },
                    name_formatter = function(buf)
                        if buf.tab_id then
                            return "TAB: " .. buf.name
                        end
                        return buf.name
                    end,
                }
            }
        end
    },

    {
        'famiu/bufdelete.nvim',
        config = function()
            vim.keymap.set('n', '<leader>bd', ':Bdelete<CR>', { noremap = true, silent = true })
        end
    },

}
