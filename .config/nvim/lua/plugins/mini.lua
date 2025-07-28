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
		event = {
			"BufReadPost",
		},
		opts = {
			-- `saiw)` - add (`sa`) for inner word (`iw`) parenthesis (`)`).
			-- delete = 'sd', -- Delete surrounding
			-- sr'" -- Replace surrounding
			-- srt -- Replace surrounding tags
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
