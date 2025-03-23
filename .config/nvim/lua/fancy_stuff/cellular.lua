return {
	"eandrju/cellular-automaton.nvim",

	vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>"),
	vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>"),
	vim.keymap.set("n", "<leader>mx", "<cmd>CellularAutomaton scramble<CR>"),
}
