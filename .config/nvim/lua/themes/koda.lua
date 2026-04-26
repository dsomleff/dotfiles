-- 	"https://github.com/oskarnurm/koda.nvim"

local koda = require("koda")
local colors = koda.get_palette("dark")

require("koda").setup({
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
})

vim.cmd("colorscheme koda")
vim.cmd(":hi statusline guibg=NONE")
