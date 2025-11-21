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

		-- Status line colors
		-- vim.api.nvim_set_hl(0, "StatusLineMedium", { fg = "#c0caf5", bg = "#1f2335", bold = true })
		-- vim.api.nvim_set_hl(0, "StatusLineGitBranchIcon", { fg = "#b6b6b5", bg = "#323231", bold = true })
		-- vim.api.nvim_set_hl(0, "StatusLineGitBranchBg", { fg = "#b6b6b5", bg = "#323231", bold = true })

		vim.api.nvim_set_hl(0, "StatusLineFileNameBg", { fg = "#b6b6b5", bg = "#323231" })
		vim.api.nvim_set_hl(0, "StatusLineMode", { fg = "#b6b6b5", bg = "#323231", bold = true })

		vim.api.nvim_set_hl(0, "StatusLineGitDiffAdded", { fg = "#D0D0D0" })
		vim.api.nvim_set_hl(0, "StatusLineGitDiffChanged", { fg = "#bcbcbc" })
		vim.api.nvim_set_hl(0, "StatusLineGitDiffRemoved", { fg = "#c5c5c5" })

		vim.api.nvim_set_hl(0, "StatusLineLspError", { fg = "#c5c5c5", bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspWarn", { fg = "#bcbcbc", bold = true })
		vim.api.nvim_set_hl(0, "StatusLineLspHint", { fg = "#D0D0D0", bold = true })

		-- Link the newer semantic token highlight group to our custom style
		vim.api.nvim_set_hl(0, "@lsp.type.inlayHint", { link = "LspInlayHint" })
	end,
}
