return {
	{
		"tpope/vim-fugitive",
		cmd = { "G" },
		keys = {
			{ "<leader>gs", ":G | only<CR>", {} },
			{ "<leader>gp", ":G pull<CR>", {} },
			{ "<leader>gP", ":G push<CR>", {} },
			{ "<leader>gf", ":G fetch<CR>", {} },
			-- { "<leader>gb", ":G blame <CR>", {} }, -- add -C -C -C to :G blame if you want more deep info; add -w to ignore whitespace
			{ "<leader>gd", ":Gvdiff<CR>", {} },
			{ "<leader>gH", ":G log --oneline --decorate --graph --parents --all<CR>", {} },
			-- { "<leader>gl", ":G log | only<CR>", {} },
			{ "<leader>gl", ":0GcLog<CR>", {} },
			{ "<leader>mc", ":Gvdiffsplit!<CR>", {} },
			{ "<leader>gD", ":G branch -D ", {} }, -- Force delete branch interactive
			{ "gj", ":diffget //3<CR>", {} }, -- get from right
			{ "gf", ":diffget //2<CR>", {} }, -- get from left
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
			map({ "n", "v" }, "<leader>gbb", ":Gitsigns blame_line<CR>", {})
			map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", {})
			map("n", "]h", ":Gitsigns next_hunk<CR>", {})
			map("n", "[h", ":Gitsigns prev_hunk<CR>", {})
			map("n", "<leader>gb", ":Gitsigns blame<CR>", {})
			map("n", "<leader>hd", ":Gitsigns diffthis<CR>", {})
		end,
	},
}
