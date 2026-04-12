return function(config)
	config.colors = {
		foreground = "#deeeed",
		background = "#101010",
		cursor_bg = "#deeeed",
		cursor_fg = "#101010",
		cursor_border = "#deeeed",

		selection_fg = "#0a0a0a",
		selection_bg = "#7a7a7a",

		ansi = {
			"#080808",
			"#D70000",
			"#789978",
			"#ffaa88",
			"#7788AA",
			"#D7007D",
			"#708090",
			"#deeeed",
		},

		brights = {
			"#444444",
			"#D70000",
			"#789978",
			"#ffaa88",
			"#7788AA",
			"#D7007D",
			"#708090",
			"#deeeed",
		},

		tab_bar = {
			background = "#101010",
			active_tab = {
				bg_color = "#101010",
				fg_color = "#789978",
				intensity = "Bold",
			},
			inactive_tab = {
				bg_color = "#101010",
				fg_color = "#555555",
			},
		},
	}

	config.window_background_opacity = 1.0
	config.macos_window_background_blur = 20
	config.window_decorations = "RESIZE"

	config.window_padding = {
		left = 12,
		right = 12,
		top = 12,
		bottom = 12,
	}
end
