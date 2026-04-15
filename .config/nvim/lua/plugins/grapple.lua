local Grapple = require("grapple")

Grapple.setup({
	icons = false,
	scope = "git",
	style = "basename",
	quick_select = "123456789",
	tag_title = function()
		return "Grapple"
	end,
	win_opts = {
		footer = "",
	},
})

local map = vim.keymap.set

map("n", "<leader>a", "<cmd>Grapple toggle<cr>", { desc = "Tag a file" })
map("n", "<c-e>", "<cmd>Grapple toggle_tags<cr>", { desc = "Toggle tags menu" })

local quick_select_chars = "123456789"

for i = 1, #quick_select_chars do
	local char = quick_select_chars:sub(i, i)
	map("n", "<leader>" .. char, function()
		Grapple.select({ index = i })
	end, { desc = "Grapple select tag " .. i .. " (" .. char .. ")" })
end
