vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "master",
	},
})

local parsers = {
	"bash",
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
	"html",
	"javascript",
	"json",
	"toml",
	"tsx",
	"typescript",
	"yaml",
}
require("nvim-treesitter.configs").setup({
	ensure_installed = parsers,
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
