local map = vim.keymap.set
vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
-- Window splitting
vim.keymap.set('n', '<Leader>sv', ':vsplit<CR>')
vim.keymap.set('n', '<Leader>sh', ':hsplit<CR>')
-- Clear search highlighting
vim.keymap.set('n', '<Leader>/', ':nohlsearch<CR>')
-- Save and quit shortcuts
vim.keymap.set('n', '<Leader>w', ':w<CR>')   -- Save
vim.keymap.set('n', '<Leader>q', ':q<CR>')   -- Quit
vim.keymap.set('n', '<Leader>qq', ':qa<CR>') -- Quit all
vim.keymap.set('n', '<Leader>Q', ':qa!<CR>') -- Force quit all
-- Resize splits
vim.keymap.set('n', '<Leader>+', ':vertical resize +5<CR>')
vim.keymap.set('n', '<Leader>-', ':vertical resize -5<CR>')
vim.keymap.set('n', '<Leader>=', ':resize +5<CR>')
vim.keymap.set('n', '<Leader>_', ':resize -5<CR>')
-- Neo Tree
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')
-- Tab management
vim.keymap.set('n', '<Leader>tn', ':tabnew<CR>')      -- New tab
vim.keymap.set('n', '<Leader>tc', ':tabclose<CR>')    -- Close tab
vim.keymap.set('n', '<Leader>tn', ':tabnext<CR>')     -- Next tab
vim.keymap.set('n', '<Leader>tp', ':tabprevious<CR>') --
-- Run python
vim.keymap.set('n', '<C-c>', ':w<CR>:TermExec cmd="clear && python3 %"<CR>')
-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
-- Alt+Shift+Arrow keys to move windows (similar to VSCode behavior)
vim.keymap.set('n', '<A-S-h>', '<C-w>H', { noremap = true, desc = "Move window to far left" })
vim.keymap.set('n', '<A-S-l>', '<C-w>L', { noremap = true, desc = "Move window to far right" })
vim.keymap.set('n', '<A-S-k>', '<C-w>K', { noremap = true, desc = "Move window to very top" })
vim.keymap.set('n', '<A-S-j>', '<C-w>J', { noremap = true, desc = "Move window to very bottom" })
-- Move tabs left and right
vim.keymap.set('n', '<leader>{', ':tabmove -1<CR>', { noremap = true, silent = true, desc = "Move tab left" })
vim.keymap.set('n', '<leader>}', ':tabmove +1<CR>', { noremap = true, silent = true, desc = "Move tab right" })
-- Create splits in different directions
vim.keymap.set('n', '<leader>sh', ':leftabove vsplit<CR>', { noremap = true, silent = true, desc = "Split window left" })
vim.keymap.set('n', '<leader>sl', ':rightbelow vsplit<CR>',
    { noremap = true, silent = true, desc = "Split window right" })
vim.keymap.set('n', '<leader>sk', ':leftabove split<CR>', { noremap = true, silent = true, desc = "Split window above" })
vim.keymap.set('n', '<leader>sj', ':rightbelow split<CR>', { noremap = true, silent = true, desc = "Split window below" })
-- Beffers
-- Buffer navigation
vim.keymap.set('n', '<leader>]', ':bnext<CR>', { noremap = true, silent = true })     -- Next buffer
vim.keymap.set('n', '<leader>[', ':bprevious<CR>', { noremap = true, silent = true }) -- Previous buffer
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })  -- Delete buffer
-- Move buffer to a new tab
vim.keymap.set('n', '<leader>mt', ':tabnew | buffer #<CR>',
    { noremap = true, silent = true, desc = "Move buffer to new tab" })
-- Close the current window
vim.keymap.set('n', '<leader>wc', ':close<CR>', { noremap = true, silent = true, desc = "Close current window" })
