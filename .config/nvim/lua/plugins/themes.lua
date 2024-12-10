return {
	{
		"kvrohit/rasmus.nvim",
		name = "rasmus",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.rasmus_italic_functions = true
			vim.g.rasmus_transparent = false
			vim.g.rasmus_italic_keywords = true
			vim.g.rasmus_italic_variables = true
			vim.g.rasmus_italic_booleans = true

			vim.cmd.colorscheme("rasmus")

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

			local red_override = "#6a6a69"

			-- Override all highlight groups that use red
			vim.api.nvim_set_hl(0, "Error", { fg = red_override })
			-- vim.api.nvim_set_hl(0, "DiagnosticError", { fg = red_override })
			vim.api.nvim_set_hl(0, "SpellBad", { fg = red_override, undercurl = true, sp = red_override })
			vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineError", { sp = red_override, undercurl = true })
			vim.api.nvim_set_hl(0, "Underlined", { fg = red_override })
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
