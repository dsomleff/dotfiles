-- 	"https://github.com/oskarnurm/koda.nvim"

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

vim.cmd(":hi statusline guibg=NONE")
