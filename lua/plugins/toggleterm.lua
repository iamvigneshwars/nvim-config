return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<C-\>]],
            hide_numbers = true,
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            direction = "horizontal",
            close_on_exit = true,
            shell = vim.o.shell,
            auto_scroll = true,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            hidden = true,
            on_open = function()
                vim.cmd("startinsert!")
            end,
        })
        local python = Terminal:new({
            cmd = "python3",
            direction = "float",
            hidden = true,
            on_open = function()
                vim.cmd("startinsert!")
            end,
        })
        _G.toggle_lazygit = function()
            lazygit:toggle()
        end
        _G.toggle_python = function()
            python:toggle()
        end
        vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua toggle_lazygit()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua toggle_python()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
    end,
}
