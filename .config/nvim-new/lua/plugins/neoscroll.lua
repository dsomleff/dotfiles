vim.pack.add({
	"https://github.com/karb94/neoscroll.nvim",
})

local neoscroll = require("neoscroll")

neoscroll.setup({
	mappings = { "<C-u>", "<C-d>" },
	duration_multiplier = 0.3,
})

vim.keymap.set("n", "<C-u>", function()
	neoscroll.ctrl_u({ duration = 400, easing = "sine" })
end, { desc = "Neoscroll Ctrl-U" })

vim.keymap.set("n", "<C-d>", function()
	neoscroll.ctrl_d({ duration = 400, easing = "sine" })
end, { desc = "Neoscroll Ctrl-D" })
