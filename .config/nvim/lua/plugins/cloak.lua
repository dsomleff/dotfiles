return {
	"laytan/cloak.nvim",
	event = "BufReadPre",
	opts = {
		enabled = true,
		cloak_character = "*",
		highlight_group = "Comment",
		patterns = {
			{
				file_pattern = {
					".env*",
					".dev.vars",
				},
				cloak_pattern = "=.+",
			},
		},
	},
	keys = {
		{ "<leader>ct", ":CloakToggle<CR>", desc = "Toggle cloak" },
		{ "<leader>cp", ":CloakPreviewLine<CR>", desc = "Preview line" },
	},
}
