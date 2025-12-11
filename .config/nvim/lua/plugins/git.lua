return {
	{
		"tpope/vim-fugitive",
		cmd = "G",
		keys = {
			{ "<leader>gs", "<cmd>G | only<CR>", desc = "Git status" },
			{ "<leader>gp", "<cmd>G pull<CR>", desc = "Git pull" },
			{ "<leader>gP", "<cmd>G push<CR>", desc = "Git push" },
			{ "<leader>gf", "<cmd>G fetch<CR>", desc = "Git fetch" },
			{ "<leader>gD", "<cmd>Gvdiff<CR>", desc = "Git diff" },
			{ "<leader>gH", "<cmd>G log --oneline --decorate --graph --parents --all<CR>", desc = "Git history" },
			{ "<leader>gl", "<cmd>0GcLog<CR>", desc = "Git log" },
			-- { "<leader>gl", ":G log | only<CR>", {} },
			{ "<leader>gd", ":G branch -D ", desc = "Force delete branch" },
			{ "<leader>mc", "<cmd>Gvdiffsplit!<CR>", desc = "Merge conflict" },
			{ "gh", "<cmd>diffget //2<CR>", desc = "Get hunk from left" },
			{ "gl", "<cmd>diffget //3<CR>", desc = "Get hunk from right" },
			-- { "<leader>gb", ":G blame <CR>", {} }, -- add -C -C -C to :G blame if you want more deep info; add -w to ignore whitespace
		},
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
			preview_config = {
				border = "single",
			},
		},
		keys = {
			{ "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
			{ "<leader>gbb", "<cmd>Gitsigns blame_line<CR>", mode = { "n", "v" }, desc = "Blame line" },
			{ "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", mode = { "n", "v" }, desc = "Reset hunk" },
			{ "]h", "<cmd>Gitsigns next_hunk<CR>", desc = "Next hunk" },
			{ "[h", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev hunk" },
			{ "<leader>gb", "<cmd>Gitsigns blame<CR>", desc = "Git blame" },
			{ "<leader>hd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff this" },
		},
	},
}
