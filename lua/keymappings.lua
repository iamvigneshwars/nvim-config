vim.g.mapleader= " "
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
vim.keymap.set('n', '<Leader>w', ':w<CR>')    -- Save
vim.keymap.set('n', '<Leader>q', ':q<CR>')    -- Quit
vim.keymap.set('n', '<Leader>qq', ':qa<CR>')    -- Quit all
vim.keymap.set('n', '<Leader>Q', ':qa!<CR>')  -- Force quit all
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
vim.keymap.set('n', '<Leader>]', ':tabnext<CR>')     -- Next tab
vim.keymap.set('n', '<Leader>[', ':tabprevious<CR>') --
-- Run python
vim.keymap.set('n', '<C-c>', ':w<CR>:TermExec cmd="python3 %"<CR>')
-- Terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
