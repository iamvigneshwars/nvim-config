return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
        { "<C-\\>", desc = "Toggle terminal" },
        { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
        { "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Vertical terminal" },
        { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal terminal" },
        { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Floating terminal" },
        { "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", desc = "Toggle all terminals" },
        { "<leader>gl", desc = "Lazygit" },
    },
    config = function()
        local toggleterm = require("toggleterm")
        local Terminal = require("toggleterm.terminal").Terminal

        toggleterm.setup({
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
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            auto_scroll = true,
            float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.8),
                height = math.floor(vim.o.lines * 0.8),
                winblend = 0,
            },
        })

        -- Lazygit terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            hidden = true,
            count = 99,
            on_open = function(term)
                vim.cmd("startinsert!")
                vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<esc>", { noremap = true })
            end,
        })

        vim.keymap.set("n", "<leader>gl", function()
            lazygit:toggle()
        end, { desc = "Lazygit" })

        -- New terminal in buffer
        vim.keymap.set("n", "<leader>tb", function()
            vim.cmd("enew")
            vim.cmd("term")
            vim.cmd("startinsert")
        end, { desc = "Terminal in buffer" })

        -- Close all terminals
        vim.keymap.set("n", "<leader>tc", function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                local bufname = vim.api.nvim_buf_get_name(buf)
                if bufname:match("term://") then
                    vim.api.nvim_buf_delete(buf, { force = true })
                end
            end
            vim.notify("Closed all terminals", vim.log.levels.INFO)
        end, { desc = "Close all terminals" })

        -- Terminal keymaps
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0, noremap = true }
            local bufname = vim.api.nvim_buf_get_name(0)
            if not bufname:match("lazygit") then
                vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            end
            vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
            vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
            vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
            vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
        end

        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*",
            callback = set_terminal_keymaps,
        })
    end,
}
