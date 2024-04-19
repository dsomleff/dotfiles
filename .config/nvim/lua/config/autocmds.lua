-- format on save
vim.api.nvim_create_augroup("AutoFormatting", {})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = "AutoFormatting",
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- open Netrw after now open buffers left
vim.api.nvim_create_augroup("AutoCommands", {})

vim.api.nvim_create_autocmd("BufEnter", {
    group = "AutoCommands",
    pattern = "*",
    command = "if !argc() | Explore | endif",
})
