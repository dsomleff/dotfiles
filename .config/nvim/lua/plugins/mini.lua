return {
	{
		"echasnovski/mini.ai",
		version = false,
		event = {
			"BufReadPost",
		},
		opts = {
			-- around/next quotes = "aq"
			-- around/next brackets = "ab"
			-- around/next arguments = "aa"
			-- around_last = "al",
			-- inside_last = "il",
			-- around_next = "an",
			-- inside_next = "in",
		},
	},
	{
		"echasnovski/mini.surround",
		version = false,
		event = { "BufReadPost" },
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding
				delete = "gsd", -- Delete surrounding
				replace = "gsr", -- Replace surrounding
				find = "gsf", -- Find to the right
				find_left = "gsF", -- Find to the left
				highlight = "gsh", -- Highlight surrounding
				update_n_lines = "gsn", -- Update n_lines
				suffix_last = "gsl", -- Go to last surrounding
				suffix_next = "gsn", -- Go to next surrounding
			},
			n_lines = 500,
		},
	},
	-- {
	-- 	"echasnovski/mini.pairs",
	-- 	version = false,
	-- 	opts = {},
	-- 	event = {
	-- 		"BufReadPost",
	-- 	},
	-- },
}
