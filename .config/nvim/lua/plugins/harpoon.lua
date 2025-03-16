return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	opts = {}, -- No specific options needed for Harpoon's setup
	config = function(_, opts)
		local harpoon = require("harpoon")
		harpoon:setup(opts)

		local map = vim.keymap.set
		local list = harpoon:list()

		-- Add file to Harpoon
		map("n", "<leader>a", function()
			list:add()
		end)

		-- Toggle Harpoon menu
		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(list)
		end)

		-- Select Harpoon slots (1-9)
		for i = 1, 9 do
			map("n", "<leader>" .. i, function()
				list:select(i)
			end)
		end

		-- Navigate previous & next buffers in Harpoon list
		map("n", "[w", function()
			list:prev()
		end)
		map("n", "]w", function()
			list:next()
		end)
	end,
}
