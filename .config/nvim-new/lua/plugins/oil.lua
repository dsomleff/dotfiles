vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
})
-------------------------------------------------
-- Oil
-------------------------------------------------
require("oil").setup({
	-- default_file_explorer = false,
	delete_to_trash = true,
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<C-p>"] = false,
	},
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
