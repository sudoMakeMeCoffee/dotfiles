local ok, alpha = pcall(require, "alpha")
if not ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

-- Header (ASCII art or welcome message)
dashboard.section.header.val = {

    "⣿⣿⣿⣿⣿⣿⣿⡛⢿⢊⠉⢂⢀⠢⣪⣻⣾⣾⣿⣿⣿⣿⣿⡿⣮⠛⠹⣎⢁⡹",
    "⣿⣿⢿⠿⢸⣿⣿⣇⣀⣬⢷⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣜⣷⣷⣿⣿⣿",
    "⡿⡿⠈⣰⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⡷⣄⣷⣿⣿⣿⣿⣏⢿⣿⣿⣿⣿⣿⣟⠿⢿⡿⣿⣿⣿⣿⠟⡛⠻⣿⣿⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣯⠄⠻⣿⣿⣿⣿⣿⣿⢶⢸⣿⣿⣿⣯⣶⣷⢀⠙⣿⣟⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⠧⡀⠙⠿⠿⠿⠛⠄⠄⠸⠄⠻⡿⠿⡿⠋⠄⠄⠻⣿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣦⣭⣂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢿⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⢛⡅⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡄⢠⠘⣿⣿",
    "⣿⣿⣿⣿⣿⣿⣇⠘⣿⣿⣿⡷⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢧⣀⣠⣼⣿",
    "⣿⣿⣿⣿⣿⣿⠶⡔⠄⠉⠈⠁⠄⠄⠄⠐⠄⠄⠄⣀⣀⡀⠄⠄⢀⠼⠿⠿⠛⠙",
    "⣿⣿⣿⣿⣿⣿⣷⣶⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢞⡉⠔⠁⠄⠄⠂⠄⠄⠄⣀⣴",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⣀⣀⣀⣀⣀⣀⣀⣀⣤⣆⠄⠄⠄⠄⠉⠉⠉",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⠄⠄⠄⠄⠄⠄",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⠄⠄⠄⠄⠄⠄⠄",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄",
}

-- Buttons
dashboard.section.buttons.val = {
    dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
    dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
    dashboard.button("t", "  Toggle NvimTree", ":NvimTreeToggle<CR>"),
    dashboard.button("s", "  Restore Session", [[:lua require("persistence").load()<CR>]]),
    dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Footer (optional)
dashboard.section.footer.val = "✨!"

-- Highlight groups
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Comment"

-- Set dashboard
alpha.setup(dashboard.config)



-- Only open Alpha if no file is specified
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            require("alpha").start(true)
        end
    end
})
