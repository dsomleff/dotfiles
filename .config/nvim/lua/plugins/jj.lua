require("jj").setup({
	editor = {
		auto_insert = true,
	},
	terminal = {
		window = {
			type = "hsplit", -- Type of window the terminal is displayed in (hsplit/vsplit/floating/tab)
			split_size = 0.50, -- (between 0.1 and 1.0)
			floating_width = 0.99, -- (between 0.1 and 1.0)
			floating_height = 0.95, -- (between 0.1 and 1.0)
		},
	},
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>js", "<cmd>J st<CR>", opts)
vim.keymap.set("n", "<leader>jl", "<cmd>J log<CR>", opts)
vim.keymap.set("n", "<leader>jL", "<cmd>J log -r all()<CR>", opts)
-- vim.keymap.set("n", "<leader>jl", "<cmd>J log -T builtin_log_oneline<CR>", opts)

local cmd = require("jj.cmd")
vim.keymap.set("n", "<leader>jd", cmd.describe, { desc = "JJ describe" })
vim.keymap.set("n", "<leader>jn", cmd.new, { desc = "JJ new" })
vim.keymap.set("n", "<leader>jbd", cmd.bookmark_delete, { desc = "JJ bookmark delete" })
