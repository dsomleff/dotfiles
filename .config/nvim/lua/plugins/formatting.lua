return {
	"stevearc/conform.nvim",
	event = { "BufReadPost" },
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			-- json = { "prettier" },
			-- yaml = { "prettier" },
			markdown = { "prettier" },
			lua = { "stylua" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			lsp_format = "fallback",
			async = false,
			timeout_ms = 1000,
		},
		formatters = {
			prettier = {
				args = {
					"--stdin-filepath",
					"$FILENAME",
					"--tab-width",
					"4",
					"--use-tabs",
					"false",
				},
			},
		},
	},
}
