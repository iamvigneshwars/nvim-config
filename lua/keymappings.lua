local map = vim.keymap.set
vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
-- Window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- Clear search highlighting
map('n', '<Esc>', ':nohlsearch<CR>')
-- Save and quit shortcuts
map('n', '<Leader>w', ':w<CR>')
map('n', '<Leader>q', ':q<CR>')
map('n', '<Leader>qq', ':wqa<CR>')
map('n', '<Leader>Q', ':qa!<CR>')
-- Resize splits
map('n', '<Leader>+', ':vertical resize +5<CR>')
map('n', '<Leader>-', ':vertical resize -5<CR>')
map('n', '<Leader>=', ':resize +5<CR>')
map('n', '<Leader>_', ':resize -5<CR>')
-- Neo Tree
map('n', '<C-n>', ':Neotree toggle<CR>')
-- Tab management
map('n', '<Leader>tn', ':tabnew<CR>', { noremap = true, silent = true, desc = "New tab" })
map('n', '<Leader>te', ':tabclose<CR>')    -- Close tab
map('n', '<Leader>tl', ':tabnext<CR>')     -- Next tab
map('n', '<Leader>tp', ':tabprevious<CR>') --
-- Run python
map('n', '<C-c>', ':w<CR>:TermExec cmd="clear && python3 %"<CR>')
-- Move tabs left and right
map('n', '<leader>{', ':tabmove -1<CR>', { noremap = true, silent = true, desc = "Move tab left" })
map('n', '<leader>}', ':tabmove +1<CR>', { noremap = true, silent = true, desc = "Move tab right" })
-- Create splits in different directions
map('n', '<leader>sh', ':leftabove vsplit<CR>', { noremap = true, silent = true, desc = "Split window left" })
map('n', '<leader>sl', ':rightbelow vsplit<CR>',
    { noremap = true, silent = true, desc = "Split window right" })
map('n', '<leader>sk', ':leftabove split<CR>', { noremap = true, silent = true, desc = "Split window above" })
map('n', '<leader>sj', ':rightbelow split<CR>', { noremap = true, silent = true, desc = "Split window below" })
-- Buffer navigation
map('n', '<leader>]', ':bnext<CR>', { noremap = true, silent = true })     -- Next buffer
map('n', '<leader>[', ':bprevious<CR>', { noremap = true, silent = true }) -- Previous buffer
map('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })  -- Delete buffer
-- Move buffer to a new tab
map('n', '<leader>mt', ':tabnew | buffer #<CR>',
    { noremap = true, silent = true, desc = "Move buffer to new tab" })
-- Close the current window
map('n', '<leader>wc', ':close<CR>', { noremap = true, silent = true, desc = "Close current window" })
-- Yank from clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
map({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from clipboard' })
map({ 'n', 'v' }, '<leader>P', '"+P', { desc = 'Paste from clipboard before cursor' })
-- Keymaps for switching buffers using numbers
for i = 1, 9 do
    map('n', '<leader>' .. i, function()
        require('bufferline').go_to_buffer(i, true)
    end, { desc = 'Go to buffer ' .. i })
end
-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle vertical terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
