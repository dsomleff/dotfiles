return {
	"saghen/blink.cmp",
	version = "v0.*",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = { preset = "default", ["<Tab>"] = { "select_next", "snippet_forward", "fallback" } },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				-- Exclude keywords/constants from autocomplete
				lsp = {
					name = "LSP",
					module = "blink.cmp.sources.lsp",
					transform_items = function(_, items)
						return vim.tbl_filter(function(item)
							return item.kind ~= require("blink.cmp.types").CompletionItemKind.Keyword
						end, items)
					end,
				},
			},
		},
		signature = { enabled = true },
		completion = {
			menu = {
				border = "single",
			},
			documentation = {
				window = {
					border = "single",
				},
			},
		},
	},
}
