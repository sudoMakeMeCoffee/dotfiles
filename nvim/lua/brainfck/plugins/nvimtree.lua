local ok, nvimtree = pcall(require, "nvim-tree")
if not ok then
  return
end

nvimtree.setup({
  view = { width = 35 },
  renderer = { highlight_opened_files = "all" },
  git = { enable = true },
})

-- Keymap to toggle file explorer
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

