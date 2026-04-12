local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

require("lackluster")(config)
require("keys")(wezterm, config)

-- Terminal
-- config.color_scheme = "lackluster"
config.window_background_opacity = 1.0
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.default_prog = { "/opt/homebrew/bin/nu" }
config.window_close_confirmation = "NeverPrompt"

-- Tabs
-- config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium" })
config.font_size = 18
config.line_height = 1.5

-- Mouse
config.hide_mouse_cursor_when_typing = true

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "1cell",
	bottom = 0,
}

-- Sessions
local function get_process_name(tab)
	local process_path = tab.active_pane and tab.active_pane.foreground_process_name or ""

	if process_path == "" then
		return "shell"
	end

	return string.gsub(process_path, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
	if not tab.is_active then
		for _, pane in ipairs(tab.panes) do
			if pane.has_unseen_output then
				has_unseen_output = true
				break
			end
		end
	end

	local cwd = wezterm.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Text = get_process_name(tab) },
	})

	local title = string.format(" %s. %s ", tab.tab_index + 1, cwd)

	return {
		{ Text = title },
	}
end)

wezterm.on("update-right-status", function(window)
	local workspace = window:active_workspace()

	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Foreground = { Color = "#7a7a7a" } },
		{ Text = " " .. workspace .. " " }, -- Added spaces for a little padding
	}))
end)

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"

return config
