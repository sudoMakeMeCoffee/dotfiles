require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "javascript", "python", "html", "css", "json" },
  highlight = { enable = true },
  indent = { enable = true },
})

