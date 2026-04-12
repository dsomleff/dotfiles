return function(wezterm, config)
	local act = wezterm.action
	local keys = {}

	local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

	workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"

	config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 }

	table.insert(keys, {
		key = "f",
		mods = "LEADER",
		action = workspace_switcher.switch_workspace(),
	})

	table.insert(keys, {
		key = "s",
		mods = "LEADER",
		action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	})

	table.insert(keys, {
		key = "[",
		mods = "LEADER",
		action = act.SwitchWorkspaceRelative(1),
	})

	table.insert(keys, {
		key = "]",
		mods = "LEADER",
		action = act.SwitchWorkspaceRelative(-1),
	})

	table.insert(keys, {
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	})

	for i = 1, 9 do
		table.insert(keys, {
			key = tostring(i),
			mods = "LEADER",
			action = act.ActivateTab(i - 1),
		})
	end

	config.keys = keys
end
