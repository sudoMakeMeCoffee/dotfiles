-- ToggleTerm setup
require("toggleterm").setup {
    size = 20,
    open_mapping = [[<leader>t]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal", -- can be "vertical", "horizontal", or "float"
    close_on_exit = true,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    }
}

-- Optional: helper function to toggle terminal
function _G.toggle_term()
    require("toggleterm.terminal").Terminal:new():toggle()
end
