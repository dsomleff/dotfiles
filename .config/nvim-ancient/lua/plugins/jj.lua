return {
	{
		"nicolasgb/jj.nvim",
		version = "*", -- Use latest stable release
		-- Or from the main branch (uncomment the branch line and comment the version line)
		-- branch = "main",
		keys = {
			{ "<leader>js", "<cmd>J st<CR>", desc = "JJ status" },
			{ "<leader>jl", "<cmd>J log<CR>", desc = "JJ log" },
			{ "<leader>jL", "<cmd>J log -r all()<CR>", desc = "JJ log all revisions" },
			-- { "<leader>jl", "<cmd>J log -T builtin_log_oneline<CR>", desc = "JJ log" },
		},
		config = function()
			require("jj").setup({})
		end,
	},
}
