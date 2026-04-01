return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	config = function()
		local parsers = {
			"bash",
			"css",
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
			"lua",
			"markdown",
			"nu",
			"query",
			"scss",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
			"zsh",
		}

		local filetypes = {
			"bash",
			"css",
			"dockerfile",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"go",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"lua",
			"markdown",
			"nu",
			"scss",
			"sh",
			"toml",
			"typescript",
			"typescriptreact",
			"yaml",
			"yml",
			"zsh",
		}

		require("nvim-treesitter").install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = filetypes,

			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
