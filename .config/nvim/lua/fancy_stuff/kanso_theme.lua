return {
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanso").setup({
				overrides = function(colors)
					local ui = colors.theme.ui
					local diag = colors.theme.diag
					local diff = colors.theme.vcs

					return {
						StatusLineFileNameBg = { fg = ui.fg, bg = ui.bg_p1 },
						StatusLineMode = { fg = ui.fg, bg = ui.bg_p1, bold = true },

						-- Git diff
						StatusLineGitDiffAdded = { fg = diff.added },
						StatusLineGitDiffChanged = { fg = diff.changed },
						StatusLineGitDiffRemoved = { fg = diff.removed },

						-- LSP diagnostics
						StatusLineLspError = { fg = diag.error, bold = true },
						StatusLineLspWarn = { fg = diag.warning, bold = true },
						StatusLineLspHint = { fg = diag.hint, bold = true },
						StatusLineLspInfo = { fg = diag.info, bold = true },
					}
				end,
			})

			vim.cmd("colorscheme kanso-zen")
		end,
	},
}
