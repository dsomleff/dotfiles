local function harpoon()
	local h = require("harpoon")
	h:setup()
	return h
end

vim.keymap.set("n", "<leader>a", function()
	harpoon():list():add()
end)

vim.keymap.set("n", "<C-e>", function()
	local h = harpoon()
	h.ui:toggle_quick_menu(h:list())
end)

vim.keymap.set("n", "[w", function()
	harpoon():list():prev()
end)

vim.keymap.set("n", "]w", function()
	harpoon():list():next()
end)

for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		harpoon():list():select(i)
	end)
end
