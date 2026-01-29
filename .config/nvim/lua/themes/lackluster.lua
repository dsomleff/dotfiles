return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = function()
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
				-- StatusLineGitDiffAdded = { fg = color.green },
				-- StatusLineGitDiffChanged = { fg = color.lack },
				-- StatusLineGitDiffRemoved = { fg = color.orange },
				-- LSP diagnostics
				StatusLineLspError = { fg = color.red, bold = true },
				StatusLineLspWarn = { fg = color.orange, bold = true },
				StatusLineLspHints = { fg = color.yellow, bold = true },
				StatusLineLspInfo = { fg = color.blue, bold = true },

				-- Status line colors
				-- StatusLineGit = { bg = "#080808" },
				-- StatusLineFile = { bg = "#080808" },
				-- StatusLineCursor = { bg = "#080808" },
				-- StatusLinePercent = { bg = "#080808" },
				-- StatusLineTotalLines = { bg = "#080808" },

				["@keyword"] = {
					overwrite = false,
					italic = false,
					-- bold = true,
				},
				["@function"] = {
					overwrite = true,
					italic = true,
				},
				["@comment"] = {
					overwrite = false,
					italic = true,
				},
				["@property"] = {
					overwrite = false,
					italic = true,
				},
			},
		})

		vim.cmd.colorscheme("lackluster-hack")
		vim.cmd(":hi statusline guibg=NONE")

		-- Custom highlights
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = color.gray9, bg = "#101010" })
		-- vim.api.nvim_set_hl(0, "DiagnosticError", { fg = color.red })
		-- vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = color.orange })
		-- vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = color.blue })
		-- vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = color.yellow })
	end,
}
