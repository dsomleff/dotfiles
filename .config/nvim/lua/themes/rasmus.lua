return {
	"kvrohit/rasmus.nvim",
	name = "rasmus",
	lazy = false,
	priority = 1000,
	config = function()
		local colors = require("rasmus.colors")
		local variant = vim.g.rasmus_variant or "dark"
		local color = colors[variant]

		-- vim.g.rasmus_variant = "monochrome"
		vim.g.rasmus_italic_functions = false
		vim.g.rasmus_transparent = false
		vim.g.rasmus_italic_keywords = true
		vim.g.rasmus_italic_variables = false
		vim.g.rasmus_italic_booleans = true
		vim.g.rasmus_bold_functions = true

		vim.cmd.colorscheme("rasmus")

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = color.gray07, bg = color.bg })

		-- Override all highlight groups that use red
		vim.api.nvim_set_hl(0, "Error", { fg = color.gray05 })
		vim.api.nvim_set_hl(0, "DiagnosticError", { fg = color.bright_magenta })
		vim.api.nvim_set_hl(0, "TSError", { fg = color.bright_magenta })
		vim.api.nvim_set_hl(
			0,
			"DiagnosticUnderlineError",
			{ fg = color.bright_magenta, undercurl = true, sp = color.gray05 }
		)
		vim.api.nvim_set_hl(0, "SpellBad", { fg = color.gray05, undercurl = true, sp = color.gray05 })
		vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineError", { sp = color.gray05, undercurl = true })
		vim.api.nvim_set_hl(0, "Underlined", { fg = color.gray05 })

		-- Add custom coloring for inlay hints
		vim.api.nvim_set_hl(0, "LspInlayHint", { fg = color.gray06, italic = true })

		-- Link the newer semantic token highlight group to our custom style
		vim.api.nvim_set_hl(0, "@lsp.type.inlayHint", { link = "LspInlayHint" })

		-- Git diff
		vim.api.nvim_set_hl(0, "StatusLineGitDiffAdded", { fg = color.green })
		vim.api.nvim_set_hl(0, "StatusLineGitDiffChanged", { fg = color.blue })
		vim.api.nvim_set_hl(0, "StatusLineGitDiffRemoved", { fg = color.magenta })

		-- LSP diagnostics
		vim.api.nvim_set_hl(0, "StatusLineLspError", { fg = color.red, bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspWarn", { fg = color.yellow, bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspHint", { fg = color.bright_blue, bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspInfo", { fg = color.bright_blue, bold = true })

		-- Status line colors
		-- vim.api.nvim_set_hl(0, "StatusLineGit", { bg = "#080808" })
		-- vim.api.nvim_set_hl(0, "StatusLineFile", { bg = "#080808" })
		-- vim.api.nvim_set_hl(0, "StatusLineCursor", { bg = "#080808" })
		-- vim.api.nvim_set_hl(0, "StatusLinePercent", { bg = "#080808" })
		-- vim.api.nvim_set_hl(0, "StatusLineTotalLines", { bg = "#080808" })

		-- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "" })
	end,
}
