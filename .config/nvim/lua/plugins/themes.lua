return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		local lackluster = require("lackluster")
		local color = lackluster.color

		lackluster.setup({
			tweak_color = {
				luster = color.gray7,
			},
			tweak_ui = {
				enable_end_of_buffer = true,
			},
			tweak_highlight = {
				-- Git diff
				StatusLineGitDiffAdded = { fg = color.green },
				StatusLineGitDiffChanged = { fg = color.lack },
				StatusLineGitDiffRemoved = { fg = color.orange },

				-- LSP diagnostics
				StatusLineLspError = { fg = color.red, bold = true },
				StatusLineLspWarn = { fg = color.orange, bold = true },
				StatusLineLspHints = { fg = color.yellow, bold = true },
				StatusLineLspInfo = { fg = color.blue, bold = true },

				-- Status line colors (commented in your config originally)
				-- StatusLineGit = { bg = "#080808" },
				-- StatusLineFile = { bg = "#080808" },
				-- StatusLineCursor = { bg = "#080808" },
				-- StatusLinePercent = { bg = "#080808" },
				-- StatusLineTotalLines = { bg = "#080808" },

				["@keyword"] = {
					overwrite = false,
					-- bold = true,
					italic = true,
				},
				["@function"] = {
					overwrite = true,
					link = "@keyword",
				},
				["@comment"] = {
					overwrite = false,
					italic = true,
				},
				["@property"] = {
					italic = true,
					overwrite = false,
				},
			},
		})

		vim.cmd.colorscheme("lackluster-hack")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = color.gray9, bg = "#101010" })
	end,
}
