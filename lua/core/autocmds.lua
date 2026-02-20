local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
    end,
})

-- Terminal settings
augroup("TerminalSettings", { clear = true })
autocmd("TermOpen", {
    group = "TerminalSettings",
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.cmd("startinsert")
    end,
})

-- Filetype-specific settings
augroup("FileTypeSettings", { clear = true })

-- Python
autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = "python",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
})

-- TypeScript/JavaScript
autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact", "json" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- YAML (2 spaces, strict)
autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = { "yaml", "yml", "helm" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end,
})

-- Rust
autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = "rust",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end,
})

-- Remove trailing whitespace on save
augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
    group = "TrimWhitespace",
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Auto-resize splits when terminal is resized
augroup("ResizeSplits", { clear = true })
autocmd("VimResized", {
    group = "ResizeSplits",
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Detect Helm templates (Go templating in YAML) and set filetype to "helm"
augroup("HelmFiletype", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
    group = "HelmFiletype",
    pattern = "*/templates/*.yaml,*/templates/*.tpl,*/templates/*.yml,helmfile*.yaml",
    callback = function()
        vim.bo.filetype = "helm"
    end,
})

-- Return to last edit position when opening files
augroup("RestoreCursor", { clear = true })
autocmd("BufReadPost", {
    group = "RestoreCursor",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
