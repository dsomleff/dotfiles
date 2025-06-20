return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			branch = "main",
			autotag = {
				enable = true,
			},

			ensure_installed = { "vimdoc", "javascript", "typescript", "lua", "go", "jsdoc", "vim" },

			sync_install = false,

			auto_install = true,

			indent = {
				enable = true,
			},

			highlight = {
				enable = true,

				additional_vim_regex_highlighting = { "markdown" },
			},
		})
	end,
}
