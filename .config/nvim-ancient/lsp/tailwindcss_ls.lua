return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"javascriptreact",
		"javascript.jsx",
		"typescriptreact",
		"typescript.tsx",
		"html",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	single_file_support = true,
}
