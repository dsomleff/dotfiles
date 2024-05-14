return {
	{
		"nvim-telescope/telescope.nvim",

		branch = "0.1.x",

		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						},
					},
					file_ignore_patterns = {
						".git",
						"lazy-lock.json",
						"*-lock.json",
						"node_modules",
						"%.lock",
					},
					path_display = { "truncate" },
					layout_strategy = "vertical",
					hidden = true,
				},
				pickers = {
					help_tags = {
						theme = "ivy",
					},
					find_files = {
						--theme = "dropdown",
						hidden = true,
					},
					live_grep = {
						theme = "dropdown",
						hidden = true,
						layout_config = {
							width = 0.8,
							height = 0.3,
						},
					},
					grep_string = {
						--theme = "dropdown",
						hidden = true,
					},
				},
			})

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

			vim.keymap.set("n", "<leader>fw", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>fl", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)

			vim.keymap.set("n", "<leader>fW", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
