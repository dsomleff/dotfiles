return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd", "js_beautify", stop_after_first = true },
				typescript = {},
				-- javascriptreact = { "prettier" },
				-- typescriptreact = { "prettier" },
				vue = { "prettier" },
				css = { "prettierd", "css_beautify", stop_after_first = true },
				html = { "prettierd", "html_beautify", stop_after_first = true },
				-- json = { "prettier" },
				-- yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
			},

			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}
