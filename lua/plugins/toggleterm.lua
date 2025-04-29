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
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            auto_scroll = true,
            float_opts = {
                border = "curved",
                width = math.floor(vim.o.columns * 0.8),
                height = math.floor(vim.o.lines * 0.8),
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })
        _G.term_utils = _G.term_utils or {}
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            hidden = true,
            count = 99,
            on_open = function()
                vim.cmd("startinsert!")
            end,
        })
        _G.term_utils.toggle_lazygit = function()
            lazygit:toggle()
        end
        _G.term_utils.new_horizontal_term = function()
            Terminal:new({ direction = "horizontal" }):toggle()
        end
        _G.term_utils.new_vertical_term = function()
            Terminal:new({ direction = "vertical" }):toggle()
        end
        _G.term_utils.new_float_term = function()
            Terminal:new({ direction = "float" }):toggle()
        end
        _G.term_utils.next_term = function()
            vim.cmd("ToggleTermToggleAll")
            vim.cmd("sleep 10m")
            vim.cmd("ToggleTermToggleAll")
        end
        vim.api.nvim_set_keymap("n", "<leader>gl", "<cmd>lua _G.term_utils.toggle_lazygit()<CR>",
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _G.term_utils.new_horizontal_term()<CR>",
            { noremap = true, silent = true, desc = "New horizontal terminal" })
        vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>lua _G.term_utils.new_vertical_term()<CR>",
            { noremap = true, silent = true, desc = "New vertical terminal" })
        vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua _G.term_utils.new_float_term()<CR>",
            { noremap = true, silent = true, desc = "New floating terminal" })
        vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>",
            { noremap = true, silent = true, desc = "Toggle all terminals" })

        _G.term_utils.close_all_terminals = function()
            local term_bufs = {}
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                local bufname = vim.api.nvim_buf_get_name(buf)
                if bufname:match("term://") then
                    table.insert(term_bufs, buf)
                end
            end
            for _, buf in ipairs(term_bufs) do
                vim.api.nvim_buf_delete(buf, { force = true })
            end
            vim.notify("Closed all terminals", vim.log.levels.INFO)
        end
        _G.term_utils.new_buffer_term = function()
            vim.cmd("enew")
            vim.cmd("term")
            vim.cmd("startinsert")
        end
        vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>lua _G.term_utils.new_buffer_term()<CR>",
            { noremap = true, silent = true, desc = "New terminal in current window" })
        vim.api.nvim_set_keymap("n", "<leader>tc", "<cmd>lua _G.term_utils.close_all_terminals()<CR>",
            { noremap = true, silent = true, desc = "Close all terminals" })
        vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>",
            { noremap = true, silent = true, desc = "Toggle terminal" })
        function _G.set_terminal_keymaps()
            local opts = { noremap = true }
            vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
}
