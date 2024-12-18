return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				-- background = { -- :h background
				-- 	light = "latte",
				-- 	dark = "macchiato",
				-- },
				show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
				dim_inactive = {
					enabled = true, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.35, -- percentage of the shade to apply to the inactive window
				},
			})

			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
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
