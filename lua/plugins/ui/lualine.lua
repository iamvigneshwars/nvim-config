return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = {
                    {
                        function()
                            local ok, toggleterm = pcall(require, "toggleterm.terminal")
                            if ok then
                                local terms = toggleterm.get_all()
                                return #terms > 0 and "Term:" .. #terms or ""
                            end
                            return ""
                        end,
                        color = { fg = "#ff9e64" },
                    },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
