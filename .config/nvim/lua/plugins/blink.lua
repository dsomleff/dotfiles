return {
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		-- to have a Tab as a select_next key
		-- keymap = { preset = "default", ["<Tab>"] = { "select_next", "snippet_forward", "fallback" } },
		keymap = { preset = "super-tab" },
		appearance = {
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
				draw = {
					components = {
						kind_icon = {
							text = function()
								return ""
							end,
						},
					},
				},
			},
			documentation = {
				auto_show = true,
				window = {
					border = "single",
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
