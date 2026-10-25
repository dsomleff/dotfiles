local keymap = vim.keymap.set

-- =========================
-- Gitsigns keys
-- =========================
keymap("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
keymap({ "n", "v" }, "<leader>gbb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })
keymap({ "n", "v" }, "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
keymap("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
keymap("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev hunk" })
keymap("n", "<leader>gb", "<cmd>Gitsigns blame<CR>", { desc = "Git blame" })
keymap("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff this" })
