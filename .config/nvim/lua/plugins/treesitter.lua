return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter").setup({
			indent = {
				enable = true,
			},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},

			autotag = {
				enable = true,
			},
		})

		-- To install a new treesitter run TSInstall and name of the lang
		-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
		-- "vimdoc",
		-- "javascript",
		-- "typescript",
		-- "lua",
		-- "go",
		-- "jsdoc",
		-- "vim",
		-- "toml"
		-- "dockerfile"
		-- "bash"
	end,
}
