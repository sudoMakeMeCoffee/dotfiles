local ok, luasnip = pcall(require, "luasnip")
if not ok then
  return
end

-- Load friendly-snippets if installed
require("luasnip.loaders.from_vscode").lazy_load()

-- Optional keymaps
vim.keymap.set({"i","s"}, "<C-k>", function() luasnip.expand_or_jump() end, {silent=true})
vim.keymap.set({"i","s"}, "<C-j>", function() luasnip.jump(-1) end, {silent=true})

