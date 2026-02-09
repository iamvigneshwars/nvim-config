local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Clear search highlighting
map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Save and quit
map("n", "<leader>w", ":w<CR>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>qq", ":wqa<CR>", { desc = "Save all and quit" })
map("n", "<leader>Q", ":qa!<CR>", { desc = "Force quit all" })

-- Resize splits
map("n", "<leader>+", ":vertical resize +5<CR>", { desc = "Increase width" })
map("n", "<leader>-", ":vertical resize -5<CR>", { desc = "Decrease width" })
map("n", "<leader>=", ":resize +5<CR>", { desc = "Increase height" })
map("n", "<leader>_", ":resize -5<CR>", { desc = "Decrease height" })

-- Split creation
map("n", "<leader>sh", ":leftabove vsplit<CR>", { desc = "Split left" })
map("n", "<leader>sl", ":rightbelow vsplit<CR>", { desc = "Split right" })
map("n", "<leader>sk", ":leftabove split<CR>", { desc = "Split above" })
map("n", "<leader>sj", ":rightbelow split<CR>", { desc = "Split below" })
map("n", "<leader>wc", ":close<CR>", { desc = "Close window" })

-- Tab management
map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>te", ":tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tl", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous tab" })
map("n", "<leader>{", ":tabmove -1<CR>", { desc = "Move tab left" })
map("n", "<leader>}", ":tabmove +1<CR>", { desc = "Move tab right" })

-- Buffer navigation
map("n", "<leader>]", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>[", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>mt", ":tabnew | buffer #<CR>", { desc = "Move buffer to new tab" })

-- Clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
map({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before from clipboard" })

-- Better movement
map("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
map("n", "n", "nzzzv", { desc = "Next search (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search (centered)" })

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep selection when indenting
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
