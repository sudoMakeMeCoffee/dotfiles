vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if vim.lsp.buf.format then
            vim.lsp.buf.format({ async = false })
        end
    end,
})

