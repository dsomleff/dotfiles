return {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
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
