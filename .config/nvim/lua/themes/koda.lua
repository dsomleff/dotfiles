-- 	"https://github.com/oskarnurm/koda.nvim"

local koda = require("koda")

koda.setup({
	transparent = false,
	auto = true,
	cache = true,
	styles = {
		functions = { bold = false, italic = true },
		keywords = { bold = false },
		comments = { italic = true },
		strings = { bold = false },
		constants = { bold = false },
	},

	colors = {
		border = "#ffffff",
		emphasis = "#86cd82",
		string = "#777777",
	},
	on_highlights = function(hl, c)
		hl.DiagnosticUnderlineError = { undercurl = true, sp = c.danger }
		hl.DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }
		hl.DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }
		hl.DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }
	end,
})

vim.cmd("colorscheme koda-dark")
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
