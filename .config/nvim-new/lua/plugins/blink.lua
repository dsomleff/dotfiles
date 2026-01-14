vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
	"https://github.com/rafamadriz/friendly-snippets",
})

local blink_loaded = false

local function load_blink()
	if blink_loaded then
		return
	end
	blink_loaded = true

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
			},
			documentation = {
				auto_show = true,
				window = {
					border = "single",
				},
			},
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	})
end

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	once = true,
	callback = load_blink,
})
