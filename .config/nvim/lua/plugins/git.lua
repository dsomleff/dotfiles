return {
	{
		"tpope/vim-fugitive",
		cmd = { "G" },
		keys = {
			{ "<leader>gs", ":G | only<CR>", {} },
			{ "<leader>gp", ":G pull<CR>", { silent = true, noremap = true } },
			{ "<leader>gP", ":G push<CR>", { silent = true, noremap = true } },
			{ "<leader>gf", ":G fetch<CR>", { silent = true, noremap = true } },
			{ "<leader>gb", ":G blame -w -C -C -C<CR>", { silent = true, noremap = true } },
			{ "<leader>gd", ":Gvdiff<CR>", {} },
			{ "<leader>gH", ":G log --oneline --decorate --graph --parents --all<CR>", {} },
			{ "<leader>gl", ":G log | only<CR>", {} },
			{ "<leader>gL", ":0GcLog<CR>", {} },
			{ "<leader>mc", ":Gvdiffsplit!<CR>", {} },
			{ "<leader>gD", ":G branch -D ", {} }, -- Force delete branch interactivel
		},
	},
	{
		"tpope/vim-rhubarb", -- GitHub support
		-- event = "VeryLazy",
		lazy = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost" },
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
		init = function()
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
