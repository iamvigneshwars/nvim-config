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
vim.keymap.set('n', '<leader>sl', ':rightbelow vsplit<CR>', { noremap = true, silent = true, desc = "Split window right" })
vim.keymap.set('n', '<leader>sk', ':leftabove split<CR>', { noremap = true, silent = true, desc = "Split window above" })
vim.keymap.set('n', '<leader>sj', ':rightbelow split<CR>', { noremap = true, silent = true, desc = "Split window below" })
-- Resize windows
-- vim.keymap.set('n', '<C-A-Left>', ':vertical resize -5<CR>', { noremap = true, silent = true, desc = "Decrease width" })
-- vim.keymap.set('n', '<C-A-Right>', ':vertical resize +5<CR>', { noremap = true, silent = true, desc = "Increase width" })
-- vim.keymap.set('n', '<C-A-Up>', ':resize +5<CR>', { noremap = true, silent = true, desc = "Increase height" })
-- vim.keymap.set('n', '<C-A-Down>', ':resize -5<CR>', { noremap = true, silent = true, desc = "Decrease height" })
