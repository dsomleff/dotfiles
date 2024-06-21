return {
	{
		-- "catppuccin/nvim",
		"kvrohit/rasmus.nvim",
		name = "rasmus",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("catppuccin-mocha")
			vim.g.rasmus_italic_functions = true
			vim.g.rasmus_transparent = true
			vim.g.rasmus_italic_keywords = true
			vim.g.rasmus_italic_variables = true
			vim.g.rasmus_italic_booleans = true

			vim.cmd.colorscheme("rasmus")

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	{
		"eandrju/cellular-automaton.nvim",

		vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>"),
		vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>"),
		vim.keymap.set("n", "<leader>mx", "<cmd>CellularAutomaton scramble<CR>"),
	},
	{
		"folke/zen-mode.nvim",

		vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>"),
	},
}
