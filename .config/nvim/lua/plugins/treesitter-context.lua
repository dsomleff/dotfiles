return {
	"nvim-treesitter/nvim-treesitter-context",
	event = { "BufReadPost" },
	config = function()
		vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "Grey" })
		vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", { underline = true, sp = "Grey" })
	end,
}
