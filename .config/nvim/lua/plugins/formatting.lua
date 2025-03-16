return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
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

		format_on_save = {
			lsp_format = "fallback",
			async = false,
			timeout_ms = 1000,
		},
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)

		-- Custom Prettier configuration
		conform.formatters.prettier = {
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		}
	end,
}
