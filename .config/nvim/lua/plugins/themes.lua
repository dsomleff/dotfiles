return {
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			local lackluster = require("lackluster")

			lackluster.setup({
				tweak_ui = {
					enable_end_of_buffer = true,
				},
				tweak_background = {
					normal = "#0A0A0A",
					-- normal = 'none',    -- transparent
					-- normal = '#a1b2c3',    -- hexcode
					-- normal = color.green,    -- lackluster color
				},
			})
			vim.cmd.colorscheme("lackluster-hack")
		end,
	},
	-- {
	-- 	"kvrohit/rasmus.nvim",
	-- 	name = "rasmus",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.rasmus_italic_functions = true
	-- 		vim.g.rasmus_transparent = false
	-- 		vim.g.rasmus_italic_keywords = true
	-- 		vim.g.rasmus_italic_variables = true
	-- 		vim.g.rasmus_italic_booleans = true
	--
	-- 		vim.cmd.colorscheme("rasmus")
	--
	-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 	end,
	-- },
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
