-- return {
--     "EdenEast/nightfox.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("nightfox").setup({
--             options = {
--                 transparent = false,
--             },
--             groups = {
--                 all = {
--                     Normal = { bg = "#000000" },
--                     NormalFloat = { bg = "#000000" },
--                     StatusLine = { bg = "#000000" },
--                     VertSplit = { bg = "#000000" },
--                     TabLine = { bg = "#000000" },
--                     TabLineFill = { bg = "#000000" },
--                 },
--             },
--         })
--         vim.cmd.colorscheme("carbonfox")
--     end,
-- }
-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("tokyonight").setup({})
--         vim.cmd.colorscheme("tokyonight-night")
--     end,
-- }
return {
    "oxidescheme/oxide.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("oxide").setup()
        vim.cmd.colorscheme("oxide")
    end,
}
