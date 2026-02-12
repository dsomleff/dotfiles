require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.statusline")
require("core.lsp")
require("core.filetypes")

vim.pack.add({
	"https://github.com/slugbyte/lackluster.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/karb94/neoscroll.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/mbbill/undotree",
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
	"https://github.com/NicolasGB/jj.nvim",
})

require("themes.lackluster")
require("plugins.git")
require("plugins.oil")
require("plugins.treesitter")
require("plugins.fzf")
require("plugins.mason")
require("plugins.fidget")
require("plugins.blink")
require("plugins.conform")
require("plugins.harpoon")
require("plugins.undotree")
require("plugins.neoscroll")
require("plugins.jj")
