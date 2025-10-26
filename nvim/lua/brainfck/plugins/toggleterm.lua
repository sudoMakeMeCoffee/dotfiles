-- ToggleTerm setup
require("toggleterm").setup {
    size = 20,
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = false,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}

-- Manual keymap — normal mode only (fixes the lag)
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

-- Optional helper function for programmatic toggle
function _G.toggle_term()
    require("toggleterm.terminal").Terminal:new():toggle()
end
