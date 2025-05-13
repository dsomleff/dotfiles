return {
	"webhooked/kanso.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanso").setup({
			undercurl = true,
		})
		vim.cmd("colorscheme kanso-zen")
		-- vim.cmd("colorscheme kanso-ink")
	end,
}
