return {
	"folke/trouble.nvim",
	--	dependencies = {
	--		"nvim-tree/nvim-web-devicons",
	--	},

	config = function()
		--require("nvim-web-devicons")
		require("trouble").setup({
			icons = false,
			-- signs = {
			--     error = "",
			--     warning = "",
			--     hint = "",
			--     information = "",
			--     other = "",
			-- },
			use_diagnostic_signs = true,
		})

		vim.keymap.set("n", "<leader>tt", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "]t", function()
			require("trouble").next({ skip_groups = true, jump = true })
		end)
		vim.keymap.set("n", "[t", function()
			require("trouble").previous({ skip_groups = true, jump = true })
		end)
	end,
}
