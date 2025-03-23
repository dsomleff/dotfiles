return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		opts = {},
		keys = {
			vim.keymap.set("n", "<leader>a", function()
				require("harpoon"):list():add()
			end, { desc = "Harpoon | Add Mark" }),

			vim.keymap.set("n", "<C-e>", function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end, { desc = "Harpoon | Menu" }),
		},

		vim.keymap.set("n", "[w", function()
			require("harpoon"):list():prev()
		end, { desc = "Harpoon | Previous" }),

		vim.keymap.set("n", "]w", function()
			require("harpoon"):list():next()
		end, { desc = "Harpoon | Next" }),

		vim.keymap.set("n", "<leader>1", function()
			require("harpoon"):list():select(1)
		end),

		vim.keymap.set("n", "<leader>2", function()
			require("harpoon"):list():select(2)
		end),

		vim.keymap.set("n", "<leader>3", function()
			require("harpoon"):list():select(3)
		end),

		vim.keymap.set("n", "<leader>4", function()
			require("harpoon"):list():select(4)
		end),

		vim.keymap.set("n", "<leader>5", function()
			require("harpoon"):list():select(5)
		end),

		vim.keymap.set("n", "<leader>6", function()
			require("harpoon"):list():select(6)
		end),

		vim.keymap.set("n", "<leader>7", function()
			require("harpoon"):list():select(7)
		end),

		vim.keymap.set("n", "<leader>8", function()
			require("harpoon"):list():select(8)
		end),

		vim.keymap.set("n", "<leader>9", function()
			require("harpoon"):list():select(9)
		end),
	},
	{ "nvim-lua/plenary.nvim", lazy = true },
}
