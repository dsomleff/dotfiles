return {
	"kvrohit/rasmus.nvim",
	name = "rasmus",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.rasmus_italic_functions = false
		vim.g.rasmus_transparent = false
		vim.g.rasmus_italic_keywords = true
		vim.g.rasmus_italic_variables = false
		vim.g.rasmus_italic_booleans = true
		vim.g.rasmus_bold_functions = true

		vim.cmd.colorscheme("rasmus")

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		local red_override = "#6a6a69"
		local add_magenta = "#de9bc8"

		-- Override all highlight groups that use red
		vim.api.nvim_set_hl(0, "Error", { fg = red_override })
		vim.api.nvim_set_hl(0, "DiagnosticError", { fg = add_magenta })
		vim.api.nvim_set_hl(0, "TSError", { fg = add_magenta })
		vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = add_magenta, undercurl = true, sp = red_override })
		vim.api.nvim_set_hl(0, "SpellBad", { fg = red_override, undercurl = true, sp = red_override })
		vim.api.nvim_set_hl(0, "LspDiagnosticsUnderlineError", { sp = red_override, undercurl = true })
		vim.api.nvim_set_hl(0, "Underlined", { fg = red_override })

		-- Add custom coloring for inlay hints
		vim.api.nvim_set_hl(0, "LspInlayHint", {
			fg = "#505050", -- Subtle gray color
			italic = true, -- Make hints italic for better distinction
		})

		-- Link the newer semantic token highlight group to our custom style
		vim.api.nvim_set_hl(0, "@lsp.type.inlayHint", { link = "LspInlayHint" })
		-- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "" })

		-- Git diff
		-- vim.api.nvim_set_hl(0, "StatusLineGitDiffAdded", { fg = color.green })
		-- vim.api.nvim_set_hl(0, "StatusLineGitDiffChanged", { fg = color.lack })
		-- vim.api.nvim_set_hl(0, "StatusLineGitDiffRemoved", { fg = "#D7007D" })

		-- LSP diagnostics
		-- vim.api.nvim_set_hl(0, "StatusLineLspError", { fg = color.red, bold = true })
		-- vim.api.nvim_set_hl(0, "StatusLineLspWarn", { fg = color.orange, bold = true })
		-- vim.api.nvim_set_hl(0, "StatusLineLspHint", { fg = color.gray8, bold = true })
		-- vim.api.nvim_set_hl(0, "StatusLineLspInfo", { fg = color.blue, bold = true })

		-- Status line colors
		-- vim.api.nvim_set_hl(0, "StatusLineGit", { bg = "#080808" })
		-- vim.api.nvim_set_hl(0, "StatusLineFile", { bg = "#080808" })
		-- vim.api.nvim_set_hl(0, "StatusLineCursor", { bg = "#080808" })
		-- vim.api.nvim_set_hl(0, "StatusLinePercent", { bg = "#080808" })
		-- vim.api.nvim_set_hl(0, "StatusLineTotalLines", { bg = "#080808" })
	end,
}
