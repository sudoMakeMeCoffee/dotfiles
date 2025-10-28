local opt = vim.opt

opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Show relative line numbers
opt.tabstop = 2               -- Tab width = 4 spaces
opt.shiftwidth = 2            -- Indent width = 4 spaces
opt.expandtab = true          -- Use spaces instead of tabs
opt.smartindent = true        -- Auto-indent intelligently
opt.termguicolors = true      -- Enable 24-bit colors
opt.cursorline = true         -- Highlight the current line
opt.wrap = false              -- Don’t wrap long lines
opt.scrolloff = 8             -- Keep 8 lines visible above/below cursor
opt.signcolumn = "yes"        -- Always show the sign column
opt.clipboard = "unnamedplus" -- Use system clipboard
