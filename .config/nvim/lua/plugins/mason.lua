return {
	"williamboman/mason.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mason").setup()
	end,
}
