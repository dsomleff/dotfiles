return {
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-p>"] = false,
			},
			columns = {
				-- "icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
		},
	},
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
}
