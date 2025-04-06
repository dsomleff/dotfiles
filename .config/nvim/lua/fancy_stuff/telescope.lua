return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		branch = "0.1.x",
		keys = {
			{ "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Telescope | Files", silent = true } },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope | Help", silent = true } },
			{ "<leader>fW", "<cmd>Telescope live_grep<cr>", { desc = "Telescope | Word", silent = true } },
			{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Telescope | Recent Files", silent = true } },
			{ "<leader>tt", "<cmd>Telescope diagnostics<cr>", { desc = "Telescope | Diagnostics", silent = true } },
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers({
						attach_mappings = function(_, map)
							local actions = require("telescope.actions")
							map({ "n", "i" }, "<C-d>", actions.delete_buffer)
							return true
						end,
					})
				end,
				{ desc = "Telescope | Buffers", silent = true },
			},
			{
				"<leader>fl",
				function()
					local word = vim.fn.expand("<cWORD>")
					require("telescope.builtin").grep_string({ search = word })
				end,
				{ desc = "Telescope | Grep cWORD", silent = true },
			},
			{
				"<leader>fw",
				function()
					local word = vim.fn.expand("<cword>")
					require("telescope.builtin").grep_string({ search = word })
				end,
				{ desc = "Telescope | Grep cword", silent = true },
			},
		},

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
						theme = "dropdown",
						hidden = true,
						layout_config = {
							width = 0.8,
							height = 0.3,
						},
					},
				},
				extensions = {
					fzf = {},
				},
			})

			require("telescope").load_extension("fzf")
		end,
	},

	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-telescope/telescope-fzf-native.nvim", lazy = true, build = "make" }, -- suppose to make telescope faster
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = true,
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
