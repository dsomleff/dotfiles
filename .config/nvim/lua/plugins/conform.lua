return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			vue = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			-- yaml = { "prettier" },
			markdown = { "prettier" },
			lua = { "stylua" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
			-- async = false,
		},
		formatters = {
			prettierd = {
				args = {
					"--stdin-filepath",
					"$FILENAME",
					"--tab-width",
					"2",
					"--use-tabs",
					"false",
				},
			},
			prettier = {
				args = {
					"--stdin-filepath",
					"$FILENAME",
					"--tab-width",
					"2",
					"--use-tabs",
					"false",
				},
			},
		},
	},
}
