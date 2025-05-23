return {
	cmd = { "lua-language-server" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
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
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
				},
			},
		},
	},
}
