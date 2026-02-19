-- Bootstrap lazy.nvim
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

-- Load core configuration
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Setup lazy.nvim with plugin specs
require("lazy").setup({
    spec = {
        -- LSP & Completion
        { import = "plugins.lsp" },

        -- UI
        { import = "plugins.ui" },

        -- Editor enhancements
        { import = "plugins.editor" },

        -- Tools
        { import = "plugins.tools" },
    },
    defaults = {
        lazy = false,
        version = false,
    },
    install = {
        colorscheme = { "habamax" },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    rocks = {
        enabled = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

-- Theme manager (persistent + picker), independent of any single theme plugin.
require("core.theme").setup({
    default_theme = "eldritch-dark",
})
