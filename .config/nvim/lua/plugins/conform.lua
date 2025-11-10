return {
	"stevearc/conform.nvim",
	event = { "BufReadPost" },
	opts = {
		formatters_by_ft = {
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			vue = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			-- yaml = { "prettier" },
			markdown = { "prettier" },
			lua = { "stylua" },
		},
		format_after_first = true,
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
					"4",
					"--use-tabs",
					"false",
				},
			},
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
