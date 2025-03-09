return {
    -- Git signs
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    },
    -- Indent blank line
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    -- lua line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'iceberg_dark'
                }
            })
        end
    },
    -- Neo Tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
        end
    },
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
    -- Toggle Term
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 15,
                open_mapping = [[<C-/>]],
                direction = "horizontal",
                float_opts = {
                    border = "curved",
                },
            })
        end,
    },
    -- Window picker
    {

        's1n7ax/nvim-window-picker',
        name = 'window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function()
            require 'window-picker'.setup()
        end,
    },
    -- Buffer management
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
