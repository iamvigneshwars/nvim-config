-- return {
--     {
--         "EdenEast/nightfox.nvim",
--         config = function()
--             require("nightfox").setup({
--                 options = {
--                     transparent = false,
--                 },
--                 groups = {
--                     all = {
--                         -- Set the background to pitch black (#000000)
--                         Normal = { bg = "#000000" },
--                         NormalFloat = { bg = "#000000" },
--
--                         -- These settings help maintain consistency
--                         StatusLine = { bg = "#000000" },
--                         VertSplit = { bg = "#000000" },
--                         TabLine = { bg = "#000000" },
--                         TabLineFill = { bg = "#000000" },
--                     }
--                 }
--             })
--
--             vim.cmd.colorscheme("carbonfox")
--         end
--     }
-- }

return {
    "tiagovla/tokyodark.nvim",
    opts = {

    },
    config = function(_, opts)
        require("tokyodark").setup(opts)
        vim.cmd [[colorscheme tokyodark]]
        vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "Directory", { fg = "#5e81ac" })
    end,
}
