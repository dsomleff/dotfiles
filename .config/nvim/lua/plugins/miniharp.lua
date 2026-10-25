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

for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, function()
		miniharp.go_to(i)
	end, { desc = "miniharp: go to mark " .. i })
end
