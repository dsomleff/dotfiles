return {
	"mason-org/mason.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = "Mason",
	build = ":MasonUpdate",
	config = function()
		require("mason").setup({})
	end,
}
