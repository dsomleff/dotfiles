return {
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanso").setup({
				foreground = {
					dark = "saturated",
					light = "saturated",
				},
				overrides = function(colors)
					local ui = colors.theme.ui
					local diag = colors.theme.diag
					local diff = colors.theme.vcs

					return {
						StatusLineGit = { fg = ui.fg, bg = ui.bg_p1 },
						StatusLineFile = { fg = ui.fg, bg = ui.indent_line },

						-- Git diff
						StatusLineGitDiffAdded = { fg = diff.added },
						StatusLineGitDiffChanged = { fg = diff.changed },
						StatusLineGitDiffRemoved = { fg = diff.removed },

						-- LSP diagnostics
						StatusLineLspError = { fg = diag.error, bold = true },
						StatusLineLspWarn = { fg = diag.warning, bold = true },
						StatusLineLspHint = { fg = diag.hint, bold = true },
						StatusLineLspInfo = { fg = diag.info, bold = true },

						StatusLineFileType = { fg = ui.fg, bg = ui.indent_line },
						StatusLineCursor = { fg = ui.fg, bg = ui.indent_line },
						StatusLinePercent = { fg = ui.fg, bg = ui.bg_p1 },
						StatusLineTotalLines = { fg = ui.fg, bg = ui.bg_p1 },

						EndOfBuffer = { fg = ui.whitespace },
					}
				end,
			})

			vim.cmd("colorscheme kanso-zen")
		end,
	},
}
