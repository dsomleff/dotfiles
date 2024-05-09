return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",

	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			autotag = {
				enable = true,
			},

			ensure_installed = { "vimdoc", "javascript", "typescript", "lua", "go", "jsdoc" },

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
