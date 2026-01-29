return {
	"oskarnurm/koda.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("koda")

		-- Git diff
		vim.api.nvim_set_hl(0, "StatusLineGitDiffAdded", { fg = "#86cd82" })
		vim.api.nvim_set_hl(0, "StatusLineGitDiffChanged", { fg = "#d9ba73" })
		vim.api.nvim_set_hl(0, "StatusLineGitDiffRemoved", { fg = "#ff7676" })

		-- LSP diagnostics
		vim.api.nvim_set_hl(0, "StatusLineLspError", { fg = "#ff7676", bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspWarn", { fg = "#d9ba73", bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspHints", { fg = "#8ebeec", bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspInfo", { fg = "#0058d0", bold = true })
	end,
}
