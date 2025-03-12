return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = { text = '│' },
                    change = { text = '│' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked = { text = '┆' },
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = 'Next hunk' })
                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true, desc = 'Previous hunk' })
                    map('n', '<leader>hD', gs.preview_hunk, { desc = 'Preview hunk diff' })
                    map('n', '<leader>hd', gs.preview_hunk_inline, { desc = 'Preview hunk diff inline' })
                    map('n', '<leader>hb', gs.blame_line, { desc = 'Blame line' })
                    map('n', '<leader>hB', function() gs.blame_line { full = true } end, { desc = 'Blame line (full)' })
                    map('n', '<leader>hf', gs.diffthis, { desc = 'Diff this file' })
                    map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage hunk' })
                    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
                    map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = 'Stage selected hunks' })
                    map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset hunk' })
                    map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                        { desc = 'Reset selected hunks' })
                    map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset buffer' })
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select hunk' })
                end,
                linehl = false,
                numhl = true,
                word_diff = false,
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true,
                },
                sign_priority = 6,
                update_debounce = 200,
                status_formatter = nil,
                diff_opts = {
                    internal = true,
                }
            })
            vim.cmd([[
              highlight GitSignsAddInline guibg=#5F875F guifg=NONE
              highlight GitSignsChangeInline guibg=#5F87AF guifg=NONE
              highlight GitSignsDeleteInline guibg=#AF5F5F guifg=NONE
            ]])
        end,
    }
}
