require("jj").setup({})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>js", "<cmd>J st<CR>", opts)
vim.keymap.set("n", "<leader>jl", "<cmd>J log<CR>", opts)
vim.keymap.set("n", "<leader>jL", "<cmd>J log -r all()<CR>", opts)
-- vim.keymap.set("n", "<leader>jl", "<cmd>J log -T builtin_log_oneline<CR>", opts)

local cmd = require("jj.cmd")
vim.keymap.set("n", "<leader>jd", cmd.describe, { desc = "JJ describe" })
vim.keymap.set("n", "<leader>jn", cmd.new, { desc = "JJ new" })
vim.keymap.set("n", "<leader>jbd", cmd.bookmark_delete, { desc = "JJ bookmark delete" })
