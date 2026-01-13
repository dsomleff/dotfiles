return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				disable = { "lowercase-global" },
				globals = { "vim" },
			},
			format = { enable = false },
			hint = {
				enable = true,
				arrayIndex = "Disable",
			},
			workspace = {
				checkThirdParty = false,
				useGitIgnore = true,
				ignoreSubmodules = true,
				ignoreDir = { ".git" },

				maxPreload = 0,
				preloadFileSize = 0,

				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
				},
			},
		},
	},
}
