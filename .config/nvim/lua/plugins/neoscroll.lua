return {
	"karb94/neoscroll.nvim",
	keys = {
		{
			"<C-u>",
			function()
				require("neoscroll").ctrl_u({ duration = 400, easing = "sine" })
			end,
			desc = "Scroll up smoothly",
		},
		{
			"<C-d>",
			function()
				require("neoscroll").ctrl_d({ duration = 400, easing = "sine" })
			end,
			desc = "Scroll down smoothly",
		},
	},
	opts = {
		duration_multiplier = 0.3,
	},
}
