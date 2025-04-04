return {
	cmd = { "harper-ls", "--stdio" },
	root_markers = { ".git" },
	filetypes = {
		"gitcommit",
		"html",
		"javascript",
		"lua",
		"markdown",
		"toml",
		"typescript",
		"typescriptreact",
	},
	single_file_support = true,
	settings = {
		["harper-ls"] = {
			userDictPath = "~/dotfiles/.config/nvim/spell/en.utf-8.add",
			markdown = {
				IgnoreLinkTitle = false,
			},
		},
	},
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = true
	end,
}
