return {
	"karb94/neoscroll.nvim",
	event = {
		"BufReadPost",
	},
	opts = function()
		local neoscroll = require("neoscroll")

		local keymap = {
			["<C-u>"] = function()
				neoscroll.ctrl_u({ duration = 400, easing = "sine" })
			end,
			["<C-d>"] = function()
				neoscroll.ctrl_d({ duration = 400, easing = "sine" })
			end,
		}

		return {
			mappings = { "<C-u>", "<C-d>" },
			duration_multiplier = 0.3,
			keymap = keymap, -- Assign keymap to config
		}
	end,
}
