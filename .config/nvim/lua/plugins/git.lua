return {
	{
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb", -- GitHub support
		},
		opts = {}, -- No explicit setup needed for Fugitive
		config = function()
			-- Key mappings for Fugitive
			local map = vim.keymap.set
			map("n", "<leader>gs", ":G | only<CR>", {})
			map("n", "<leader>gp", ":G pull<CR>", { silent = true, noremap = true })
			map("n", "<leader>gP", ":G push<CR>", { silent = true, noremap = true })
			map("n", "<leader>gf", ":G fetch<CR>", { silent = true, noremap = true })
			map("n", "<leader>gb", ":G blame -w -C -C -C<CR>", { silent = true, noremap = true })
			map("n", "<leader>gd", ":Gvdiff<CR>", {})
			map("n", "<leader>gH", ":G log --oneline --decorate --graph --parents --all<CR>", {})
			map("n", "<leader>gl", ":G log | only<CR>", {})
			map("n", "<leader>gL", ":0GcLog<CR>", {})
			map("n", "<leader>mc", ":Gvdiffsplit!<CR>", {})
			map("n", "<leader>gD", ":G branch -D ", {}) -- Force delete branch interactively
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
		},
		config = function(_, opts)
			local gitsigns = require("gitsigns")
			gitsigns.setup(opts)

			-- Key mappings for Gitsigns
			local map = vim.keymap.set
			map("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
			map({ "n", "v" }, "<leader>gB", ":Gitsigns blame_line<CR>", {})
			map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", {})
			map("n", "]h", ":Gitsigns next_hunk<CR>", {})
			map("n", "[h", ":Gitsigns prev_hunk<CR>", {})
		end,
	},
}
