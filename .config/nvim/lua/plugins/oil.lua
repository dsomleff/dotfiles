return {
	{
		"stevearc/oil.nvim",
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		keys = {
			{ "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
		},
		opts = {
			default_file_explorer = false,
			delete_to_trash = true,
			use_default_keymaps = false,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["g."] = "actions.toggle_hidden",
			},
		},
	},
}
