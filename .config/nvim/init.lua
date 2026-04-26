require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.statusline")
require("core.lsp")
require("core.filetypes")
require("vim._core.ui2").enable({ msg = { target = "cmd" } })

vim.pack.add({
	"https://github.com/slugbyte/lackluster.nvim",
	"https://github.com/oskarnurm/koda.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/nvim-mini/mini.pick",
	"https://github.com/nvim-mini/mini.extra",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/NicolasGB/jj.nvim",
	"https://github.com/cbochs/grapple.nvim",
	"https://github.com/karb94/neoscroll.nvim",
	-- "https://github.com/tpope/vim-fugitive",
})
vim.cmd.packadd("nvim.undotree")

-- require("themes.lackluster")
require("themes.koda")
require("plugins.git")
require("plugins.oil")
require("plugins.treesitter")
require("plugins.mason")
require("plugins.blink")
require("plugins.conform")
require("plugins.neoscroll")
require("plugins.jj")
require("plugins.minipick")
require("plugins.grapple")
