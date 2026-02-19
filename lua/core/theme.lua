local M = {}

local theme_state_file = vim.fn.stdpath("state") .. "/theme.txt"

local function read_saved_theme()
    if vim.fn.filereadable(theme_state_file) == 1 then
        local lines = vim.fn.readfile(theme_state_file)
        if lines and lines[1] and lines[1] ~= "" then
            return lines[1]
        end
    end
    return nil
end

local function save_theme(name)
    vim.fn.mkdir(vim.fn.fnamemodify(theme_state_file, ":h"), "p")
    vim.fn.writefile({ name }, theme_state_file)
end

function M.available()
    local themes = vim.fn.getcompletion("", "color")
    table.sort(themes)
    return themes
end

function M.apply(name, persist)
    vim.o.background = "dark"
    local ok, err = pcall(vim.cmd.colorscheme, name)
    if not ok then
        vim.notify("Theme not found: " .. name .. "\n" .. err, vim.log.levels.ERROR)
        return false
    end
    if persist ~= false then
        save_theme(name)
    end
    return true
end

function M.pick()
    vim.ui.select(M.available(), {
        prompt = "Select colorscheme",
    }, function(choice)
        if choice then
            M.apply(choice, true)
        end
    end)
end

function M.setup(opts)
    opts = opts or {}
    local default_theme = opts.default_theme or "eldritch-dark"

    vim.api.nvim_create_user_command("Theme", function(cmd_opts)
        M.apply(cmd_opts.args, true)
    end, {
        nargs = 1,
        complete = function()
            return M.available()
        end,
    })

    vim.api.nvim_create_user_command("ThemeSelect", function()
        M.pick()
    end, { nargs = 0 })

    vim.keymap.set("n", "<leader>ut", M.pick, { desc = "Theme picker" })

    local startup_theme = read_saved_theme() or default_theme
    if not M.apply(startup_theme, false) then
        M.apply(default_theme, false)
    end
end

return M
