return {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"astro",
	},
	root_markers = { "package.json", ".git" },
	settings = {
		experimental = {
			useFlatConfig = false,
		},
		nodePath = "",
	},
}
