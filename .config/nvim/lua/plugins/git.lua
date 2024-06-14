return {
	{
		"tpope/vim-fugitive",
	},
	{
		"NeogitOrg/neogit",

		dependencies = {
			"sindrets/diffview.nvim",
		},

		config = function()
			local neogit = require("neogit")

			require("neogit").setup({

				vim.keymap.set("n", "<leader>gS", neogit.open, { silent = true, noremap = true }),
				vim.keymap.set({ "n", "v" }, "<leader>gs", ":G | only<CR>", {}),

				vim.keymap.set("n", "<leader>gp", ":G pull<CR>", { silent = true, noremap = true }),
				vim.keymap.set("n", "<leader>gP", ":G push<CR>", { silent = true, noremap = true }),
				vim.keymap.set("n", "<leader>gb", ":G blame<CR>", { silent = true, noremap = true }),

				vim.keymap.set("n", "<leader>gd", ":Gvdiff<CR>", {}),
				vim.keymap.set("n", "<leader>gH", ":G log --oneline --decorate --graph --all<CR>", {}),
				vim.keymap.set("n", "<leader>mc", ":Gvdiffsplit!<CR>", {}),

				vim.keymap.set("n", "<leader>gl", ":G log | only<CR>", {}),
				vim.keymap.set("n", "<leader>gL", ":0GcLog<CR>", {}),
			})
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
