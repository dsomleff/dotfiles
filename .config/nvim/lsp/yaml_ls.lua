return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
	root_markers = { ".git" },
	single_file_support = true,
	settings = {
		redhat = { telemetry = { enabled = false } },
		yaml = {
			format = { enable = true },
		},
	},
}
