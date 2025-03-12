return {
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
                },
                sections = {
                    lualine_x = {
                        {
                            function()
                                local term = require("toggleterm.terminal").get_all()
                                return #term > 0 and "Term:" .. #term or ""
                            end,

                            color = { fg = "#ff9e64" }
                        },
                        'encoding',
                        'fileformat',
                        'filetype',
                    }
                }
            })
        end
    },
}
