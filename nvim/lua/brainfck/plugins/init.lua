-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)


-- Plugin setup
require("lazy").setup({

    -- Essentials
    { "nvim-lua/plenary.nvim", lazy = false },


    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        config = function()
            require("brainfck.plugins.telescope")
        end,
    },

    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        config = function()
            require("brainfck.plugins.nvimtree")
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require("brainfck.plugins.treesitter")
        end,
    },

    -- Mason for LSP
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },

    -- LSPConfig
    {
        "neovim/nvim-lspconfig",
        lazy = false, -- load immediately
        config = function()
            require("brainfck.plugins.lsp")
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        config = function()
            require("brainfck.plugins.cmp")
        end,
    },
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",






    -- 🎨 Show colors for hex codes / CSS colors
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                '*', -- highlight all filetypes
                css = { rgb_fn = true, hsl_fn = true, names = true, RRGGBBAA = true, css = true },
                html = { names = true }
            })
        end,
    },



    -- 🧾 Lualine (status line)
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "tokyonight",
                    section_separators = "",
                    component_separators = "",
                },
            })
        end,
    },

    -- cool startup
    {
        "goolord/alpha-nvim",
        lazy = false, -- load on startup
        config = function()
            require("brainfck.plugins.alpha")
        end,
    },

    -- Toggle term
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("brainfck.plugins.toggleterm")
        end,
    },


    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = true, -- makes background transparent
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },

})


require("brainfck.plugins.alpha")

-- Optional: Additional immediate configs if needed
-- (already handled via Lazy.nvim config callbacks)
