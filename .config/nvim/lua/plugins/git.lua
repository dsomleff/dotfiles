return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", ":G | only<CR>", {})

			vim.keymap.set("n", "<leader>gp", ":G pull<CR>", { silent = true, noremap = true })
			vim.keymap.set("n", "<leader>gP", ":G push<CR>", { silent = true, noremap = true })
			vim.keymap.set("n", "<leader>gf", ":G fetch<CR>", { silent = true, noremap = true })

			vim.keymap.set("n", "<leader>gb", ":G blame<CR>", { silent = true, noremap = true })
			vim.keymap.set("n", "<leader>gd", ":Gvdiff<CR>", {})

			vim.keymap.set("n", "<leader>gH", ":G log --oneline --decorate --graph --all<CR>", {})
			vim.keymap.set("n", "<leader>gl", ":G log | only<CR>", {})
			vim.keymap.set("n", "<leader>gL", ":0GcLog<CR>", {})

			vim.keymap.set("n", "<leader>mc", ":Gvdiffsplit!<CR>", {})

			-- Custom branch deletion command
			vim.keymap.set("n", "<leader>gD", ":G branch -d ", {}) -- Deletes a branch interactively
			vim.keymap.set("n", "<leader>gF", ":G branch -D ", {}) -- Force delete branch interactively
		end,
	},
	{
		"lewis6991/gitsigns.nvim",

		config = function()
			require("gitsigns").setup({
				--signs = {
				--    add = { text = '+' },
				--    change = { text = '~' },
				--    delete = { text = '_' },
				--    topdelete = { text = '‾' },
				--    changedelete = { text = '~' },
				--},
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},

				vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {}),
				vim.keymap.set({ "n", "v" }, "<leader>gB", ":Gitsigns blame_line <CR>", {}),
				vim.keymap.set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk <CR>", {}),
				vim.keymap.set({ "n" }, "]h", ":Gitsigns next_hunk <CR>", {}),
				vim.keymap.set({ "n" }, "[h", ":Gitsigns prev_hunk <CR>", {}),
			})
		end,
	},
}
