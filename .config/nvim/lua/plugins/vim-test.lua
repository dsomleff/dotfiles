return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},

	vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>"),
	vim.keymap.set("n", "<leader>tf", ":TestFile<CR>"),
	vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>"),
	vim.keymap.set("n", "<leader>tl", ":TestLast<CR>"),
	vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>"),

	config = function()
		vim.cmd("let test#strategy = 'vimux'")
	end,
}
