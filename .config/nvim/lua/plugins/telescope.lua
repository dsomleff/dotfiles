return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		branch = "0.1.x",
		keys = {
			{ "<leader>fb" },
			{ "<leader>fh" },
			{ "<leader>fl" },
			{ "<leader>fh" },
			{ "<leader>fw" },
			{ "<leader>fW" },
			{ "<leader>fo" },
			{ "<leader>tt" },
			{ "<C-p>" },
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

			local builtin = require("telescope.builtin")

			local function open_buffers()
				require("telescope.builtin").buffers({
					attach_mappings = function(_, map)
						map({ "n", "i" }, "<C-d>", actions.delete_buffer)
						return true
					end,
				})
			end

			vim.keymap.set("n", "<leader>fb", open_buffers, {})

			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
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

			vim.keymap.set("n", "<leader>tt", builtin.diagnostics, {})
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
