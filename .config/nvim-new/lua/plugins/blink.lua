require("blink.cmp").setup({
	keymap = {
		preset = "super-tab",
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			lsp = {
				name = "LSP",
				module = "blink.cmp.sources.lsp",
				transform_items = function(_, items)
					local kinds = require("blink.cmp.types").CompletionItemKind
					return vim.tbl_filter(function(item)
						return item.kind ~= kinds.Keyword
					end, items)
				end,
			},
		},
	},
	signature = {
		enabled = true,
	},
	completion = {
		menu = {
			border = "single",
			draw = {
				columns = { { "kind_icon" }, { "label" }, { "kind" } },
				components = {
					kind_icon = {
						text = function()
							return ""
						end,
					},
					kind = {
						text = function(ctx)
							return ctx.kind
						end,
					},
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			window = {
				border = "single",
			},
		},
	},

	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
})
