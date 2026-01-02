return {
	"vague-theme/vague.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("vague").setup({
			on_highlights = function(hl, c)
				-- Git diff statusline highlights
				hl.StatusLineGitDiffAdded = { fg = c.plus }
				hl.StatusLineGitDiffChanged = { fg = c.keyword }
				hl.StatusLineGitDiffRemoved = { fg = c.parameter }

				-- LSP diagnostics statusline highlights
				hl.StatusLineLspError = { fg = c.error, bold = true }
				hl.StatusLineLspWarn = { fg = c.warning, bold = true }
				hl.StatusLineLspHint = { fg = c.constant, bold = true }
				hl.StatusLineLspInfo = { fg = c.keyword, bold = true }

				-- Example: optional background styling if you want later
				-- hl.StatusLineGit        = { bg = "#080808" }
				-- hl.StatusLineFile       = { bg = "#080808" }
				-- hl.StatusLineCursor     = { bg = "#080808" }
				-- hl.StatusLinePercent    = { bg = "#080808" }
				-- hl.StatusLineTotalLines = { bg = "#080808" }
			end,
		})

		vim.cmd("colorscheme vague")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
