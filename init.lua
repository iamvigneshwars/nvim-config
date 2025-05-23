-- Core Settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.shiftwidth = 4        -- Size of an indent
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true    -- Insert indents automatically
vim.opt.wrap = false          -- Disable line wrap
vim.opt.ignorecase = true     -- Ignore case when searching
vim.opt.smartcase = true      -- Don't ignore case with capitals
vim.opt.termguicolors = true  -- True color support
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.signcolumn = "yes"    -- Always show the signcolumn
vim.opt.updatetime = 250      -- Faster completion
vim.opt.timeoutlen = 300      -- Time to wait for a mapped sequence to complete
vim.opt.mouse = "a"           -- Enable mouse for all modes
vim.opt.mousemoveevent = true -- Enable mouse movement events
vim.opt.mousemodel = "popup"  -- Enable right-click popup menu
vim.opt.scrolloff = 8         -- Lines of context
vim.opt.sidescrolloff = 8     -- Columns of context
vim.opt.splitright = true     -- Put new windows right of current
vim.opt.splitbelow = true     -- Put new windows below current
vim.opt.showmode = false
vim.opt.hidden = true         -- Allow buffers to be hidden without saving

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Python-specific indentation settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.autoindent = true
        vim.opt_local.smartindent = true
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.cmd("startinsert")
    end,
})


require("keymappings")
require("lazy").setup("plugins")
