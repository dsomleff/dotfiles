vim.pack.add({
	"https://github.com/slugbyte/lackluster.nvim",
})

local lackluster = require("lackluster")
local color = lackluster.color
local bg = "#101010"

lackluster.setup({
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

		["@keyword"] = {
			overwrite = false,
			italic = false,
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

vim.cmd("colorscheme lackluster-hack")
vim.cmd(":hi statusline guibg=NONE")

-- Custom highlights
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = color.gray5, bg = bg })
vim.api.nvim_set_hl(0, "Pmenu", { fg = color.gray5, bg = bg })
vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = color.gray5, bg = bg })
