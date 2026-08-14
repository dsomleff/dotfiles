local miniharp = require("miniharp")

miniharp.setup({
	autoload = true, -- load marks for this cwd on startup (default: true)
	autosave = true, -- save marks for this cwd on exit (default: true)
	show_on_autoload = false, -- show popup list after a successful autoload (default: false)
	notifications = true, -- enable notification and status messages (default: true)
	ui = {
		position = "center", -- 'center' | 'top-left' | 'top-right' | 'bottom-left' | 'bottom-right'
		show_hints = false, -- show close hints in the floating list (default: true)
		enter = true, -- enter the floating window when it opens (default: true)
		auto_hide = false, -- hide while the list covers the editor cursor (default: false)
	},
})

vim.keymap.set("n", "<leader>a", miniharp.toggle_file, { desc = "miniharp: toggle file mark" })
vim.keymap.set("n", "<leader>A", miniharp.clear, { desc = "miniharp: nuke all marks" })
vim.keymap.set("n", "<C-n>", miniharp.next, { desc = "miniharp: next file mark" })
vim.keymap.set("n", "<C-b>", miniharp.prev, { desc = "miniharp: prev file mark" })
vim.keymap.set("n", "<C-e>", miniharp.show_list, { desc = "miniharp: toggle marks list" })

vim.keymap.set("n", "<leader>1", function()
	miniharp.go_to(1)
end, { desc = "miniharp: go to mark 1" })

vim.keymap.set("n", "<leader>2", function()
	miniharp.go_to(2)
end, { desc = "miniharp: go to mark 2" })

vim.keymap.set("n", "<leader>3", function()
	miniharp.go_to(3)
end, { desc = "miniharp: go to mark 3" })

vim.keymap.set("n", "<leader>4", function()
	miniharp.go_to(4)
end, { desc = "miniharp: go to mark 4" })

vim.keymap.set("n", "<leader>5", function()
	miniharp.go_to(5)
end, { desc = "miniharp: go to mark 5" })

vim.keymap.set("n", "<leader>6", function()
	miniharp.go_to(6)
end, { desc = "miniharp: go to mark 6" })

vim.keymap.set("n", "<leader>7", function()
	miniharp.go_to(7)
end, { desc = "miniharp: go to mark 7" })

vim.keymap.set("n", "<leader>8", function()
	miniharp.go_to(8)
end, { desc = "miniharp: go to mark 8" })

vim.keymap.set("n", "<leader>9", function()
	miniharp.go_to(9)
end, { desc = "miniharp: go to mark 9" })
