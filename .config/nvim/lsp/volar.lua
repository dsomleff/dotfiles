return {
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "vue" },
	root_markers = { "package.json" },
	init_options = {
		typescript = {
			-- tsdk = "",
			tsdk = "/usr/local/lib/node_modules/typescript/lib",
			vue = {
				hybridMode = false,
			},
		},
	},
}
