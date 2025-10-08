return {
	{
		"nvim-lualine/lualine.nvim",
		event = { "VeryLazy" },
		dependencies = {
			"echasnovski/mini.icons",
			lazy = true,
		},
		config = function()
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()
			require("lualine").setup({
				options = {
					theme = "nord",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					always_divide_middle = true,
					globalstatus = false,
				},
				sections = {
					lualine_a = {
						{ "branch", icon = "" },
					},
					lualine_b = {
						{
							"filename",
							file_status = true,
							path = 1,
						},
					},
					lualine_c = {
						"diff",
						{ "diagnostics", sources = { "nvim_diagnostic" } },
					},
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
