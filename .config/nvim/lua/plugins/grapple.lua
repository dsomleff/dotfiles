local Grapple = require("grapple")

Grapple.setup({
	icons = false,
	scope = "git",
	style = "basename", ---@type "basename" | "relative"
	quick_select = "123456789",
	-- tag_title = function()
	-- 	return "Grapple"
	-- end,
	win_opts = {
		width = 80,
		height = 10,
		title_pos = "center",
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
		local tags = Grapple.tags()
		if tags and i <= #tags then
			Grapple.select({ index = i })
		else
			print("Slot " .. i .. " is empty")
		end
	end, { desc = "Grapple select tag " .. i .. " (" .. char .. ")" })
end
