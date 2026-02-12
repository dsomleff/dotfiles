require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		markdown = { "prettierd" },
		lua = { "stylua" },
		bash = { "shfmt" },
		sh = { "shfmt" },
		["_"] = { "trim_whitespace", "trim_newlines" },
		go = { "goimports", "gofumpt" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
	formatters = {
		-- prettier = {
		-- 	args = {
		-- 		"--stdin-filepath",
		-- 		"$FILENAME",
		-- 		"--tab-width",
		-- 		"4",
		-- 		"--use-tabs",
		-- 		"false",
		-- 	},
		-- },
	},
})
