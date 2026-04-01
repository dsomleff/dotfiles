return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"javascriptreact",
		"typescriptreact",
		"html",
		"css",
		"scss",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	single_file_support = true,
}
