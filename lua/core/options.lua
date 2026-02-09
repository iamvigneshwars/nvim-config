-- Leader key (must be set before lazy)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Display
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Behavior
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true
vim.opt.mousemodel = "popup"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hidden = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Backup/swap (disable for better performance)
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Undo persistence
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
