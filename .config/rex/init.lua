---@meta
---@diagnostic disable: undefined-global
local TERMINAL = "com.superlogical.terminal"
local SHELL = TERMINAL .. ".shell"
local SESSIONIZER = os.getenv("HOME") .. "/dotfiles/.config/rex/sessionizer.sh"
local OPEN_GITHUB = os.getenv("HOME") .. "/dotfiles/.config/scripts/open-github.sh"

local function pane_cwd(ctx)
	local r = rex.block.call(TERMINAL, "process", { block_id = ctx.block_id })
	return r and r.foreground and r.foreground.cwd
end

local function new_window(layout)
	local w, err = rex.session.new_window({ layout = layout, focus = true })
	if err ~= nil then
		error("new_window: " .. tostring(err), 0)
	end
	if w.window_id then
		rex.session.focus_window({ window_id = w.window_id })
	end
	if w.block_ids and w.block_ids[1] then
		rex.session.focus_block({ block_id = w.block_ids[1] })
	end

	rex.exec({ "sleep", "0.1" })
	local view = rex.session.view({})
	if view and view.windows then
		for idx, win in ipairs(view.windows) do
			if win.window_id == w.window_id then
				rex.client.queue("client.tab.goto", { index = idx })
				return
			end
		end
		rex.client.queue("client.tab.goto", { index = #view.windows })
	end
end

rex.bind("ctrl+s>g", function(ctx)
	local r = rex.exec({ OPEN_GITHUB }, { cwd = pane_cwd(ctx) })
	if r and not r.ok then
		rex.log("warn", "open-github: " .. r.stdout)
	end
	return true
end)

rex.action({
	name = "new_tab_with_zsh",
	title = "New zsh Tab in Current Directory",
	run = function(ctx)
		new_window(rex.layout.block({
			flavor = SHELL,
			options = { cwd = pane_cwd(ctx), shell = "/bin/zsh" },
		}))
	end,
})

rex.action({
	name = "open_project_sessionizer",
	title = "Open Project Sessionizer",
	run = function(ctx)
		rex.session.new_layer({
			session_id = ctx.session_id,
			bounds = { 0.15, 0.15, 0.7, 0.7 },
			layout = rex.layout.block({
				flavor = SHELL,
				options = { command = { SESSIONIZER } },
			}),
			focus = true,
		})
	end,
})

rex.bind("ctrl+s>s", "session.switch")
rex.bind("ctrl+s>f", "open_project_sessionizer")
rex.bind("ctrl+s>ctrl+s", "pane.send_key", { key = "ctrl+s" })

rex.bind("ctrl+s>c", "client.tab.new")
rex.bind("ctrl+s>z", "new_tab_with_zsh")

rex.bind("ctrl+s>a", "client.sidebar.activity.toggle")

rex.bind("ctrl+s>h", "pane.focus", { direction = "left" })
rex.bind("ctrl+s>j", "pane.focus", { direction = "down" })
rex.bind("ctrl+s>k", "pane.focus", { direction = "up" })
rex.bind("ctrl+s>l", "pane.focus", { direction = "right" })
rex.bind("ctrl+s>m", "pane.zoom")

for i = 1, 9 do
	rex.bind("ctrl+s>" .. i, "client.tab.goto", { index = i })
end
