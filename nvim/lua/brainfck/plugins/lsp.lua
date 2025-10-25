-- brainfck/plugins/lsp.lua

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify("nvim-lspconfig not found", vim.log.levels.ERROR)
  return
end

local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_ok then
  vim.notify("cmp_nvim_lsp not found", vim.log.levels.ERROR)
end

-- LSP servers to setup
local servers = { "pyright", "ts_ls", "lua_ls", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
    capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities() or nil,
  })
end

