vim.g.mapleader = " " -- Set <leader> key to Space
local keymap = vim.keymap.set

keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })


-- Keymap for ToggleTerm
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>lua _G.toggle_term()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-t>", "<cmd>lua _G.toggle_term()<CR>", { noremap = true, silent = true })
