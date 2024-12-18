return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		snippet = {
			expand = function(args)
				require("blink.cmp").expand_snippet(args.body)
			end,
		},
	},
	config = function(_, opts)
		require("blink.cmp").setup(opts)
	end,
}
