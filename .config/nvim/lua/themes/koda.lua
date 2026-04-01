vim.pack.add({
	{ src = "https://github.com/oskarnurm/koda.nvim", name = "koda" },
})

vim.cmd("colorscheme koda")
vim.cmd(":hi statusline guibg=NONE")

vim.api.nvim_set_hl(0, "StatusLineLspError", { fg = "#ff7676", bold = true })
vim.api.nvim_set_hl(0, "StatusLineLspWarn", { fg = "#d9ba73", bold = true })
vim.api.nvim_set_hl(0, "StatusLineLspHints", { fg = "#8ebeec", bold = true })
vim.api.nvim_set_hl(0, "StatusLineLspInfo", { fg = "#0058d0", bold = true })
