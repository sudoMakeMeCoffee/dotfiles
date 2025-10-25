local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup({
  defaults = {
    prompt_prefix = "🔍 ",
    sorting_strategy = "ascending",
    layout_config = { prompt_position = "top" },
  },
})

-- Set keymaps AFTER telescope is required
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Find Help" })

