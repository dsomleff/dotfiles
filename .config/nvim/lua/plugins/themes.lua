return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("lackluster-hack")
		-- vim.cmd.colorscheme("lackluster")
		-- vim.cmd.colorscheme("lackluster-mint")
		vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#5e5e5e" })

		vim.api.nvim_set_hl(0, "StatusLineGitDiffAdded", { fg = "#789978" })
		vim.api.nvim_set_hl(0, "StatusLineGitDiffChanged", { fg = "#708090" })
		vim.api.nvim_set_hl(0, "StatusLineGitDiffRemoved", { fg = "#D7007D" })

		vim.api.nvim_set_hl(0, "StatusLineLspError", { fg = "#D70000", bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspWarn", { fg = "#ffaa88", bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspHint", { fg = "#cccccc", bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspInfo", { fg = "#7788AA", bold = true })
	end,
}
