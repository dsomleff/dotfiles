return {
	cmd = { "biome" },
	filetypes = {
		"css",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"typescript",
		"typescriptreact",
		"vue",
	},
	root_markers = {
		"package-lock.json",
		"yarn.lock",
		"pnpm-lock.yaml",
		"bun.lockb",
		"bun.lock",
		"deno.lock",
	},
	workspace_required = true,
}
