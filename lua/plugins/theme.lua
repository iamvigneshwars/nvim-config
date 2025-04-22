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
--                         Normal = { bg = "#000000" },
--                         NormalFloat = { bg = "#000000" },
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

-- return {
--     "tiagovla/tokyodark.nvim",
--     opts = {
--
--     },
--     config = function(_, opts)
--         require("tokyodark").setup(opts)
--         vim.cmd [[colorscheme tokyodark]]
--         vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
--         vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
--         vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
--         vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#000000" })
--         vim.api.nvim_set_hl(0, "Directory", { fg = "#5e81ac" })
--     end,
-- }
-- return {
--     {
--         "Mofiqul/vscode.nvim",
--         priority = 1000,
--         config = function()
--             require("vscode").setup({
--                 transparent = false,
--                 italic_comments = true,
--                 disable_nvimtree_bg = true,
--                 color_overrides = {
--                     vscBack = '#000000',
--                     vscGreen = '#76D765',
--                 },
--                 group_overrides = {
--                     Normal = { bg = '#000000' },
--                     NormalFloat = { bg = '#000000' },
--                     StatusLine = { bg = '#000000' },
--                     StatusLineNC = { bg = '#000000' },
--                     VertSplit = { bg = '#000000' },
--                     TabLine = { bg = '#000000' },
--                     TabLineFill = { bg = '#000000' },
--                     SignColumn = { bg = '#000000' },
--                     LineNr = { bg = '#000000' },
--                     Comment = { fg = '#707070', italic = true },
--                     LineComment = { fg = '#707070', italic = true },
--                     Special = { fg = '#4CB2FF' },
--                     Directory = { fg = '#4CB2FF' },
--                     Title = { fg = '#4CB2FF' },
--                 }
--             })
--             vim.cmd.colorscheme("vscode")
--             vim.o.background = "dark"
--             vim.cmd([[
--                 highlight Normal guibg=#000000 ctermbg=0
--                 highlight NonText guibg=#000000 ctermbg=0
--                 highlight Comment guifg=#707070 gui=italic
--                 highlight @comment guifg=#707070 gui=italic
--                 highlight Directory guifg=#4CB2FF
--                 highlight @namespace guifg=#4CB2FF
--                 highlight Special guifg=#4CB2FF
--                 highlight @text.title guifg=#4CB2FF
--             ]])
--         end
--     }
-- }
return {
    {
        "eldritch-theme/eldritch.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false,
            colors = {
                bg = "#000000"
            },
        },
        config = function(_, opts)
            require("eldritch").setup(opts)
            vim.cmd("colorscheme eldritch")
            vim.cmd("hi Normal guibg=#000000 ctermbg=0")
            vim.cmd("hi NormalFloat guibg=#000000 ctermbg=0")
            vim.cmd("hi NonText guibg=#000000 ctermbg=0")
            vim.cmd("hi LineNr guibg=#000000 ctermbg=0")
            vim.cmd("hi SignColumn guibg=#000000 ctermbg=0")
            vim.cmd("hi EndOfBuffer guibg=#000000 ctermbg=0")
            vim.opt.termguicolors = true
        end,
    }
}
