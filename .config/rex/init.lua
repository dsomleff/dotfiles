---@meta
---@diagnostic disable: undefined-global
local TERMINAL = "com.superlogical.terminal"
local SHELL = TERMINAL .. ".shell"
local SESSIONIZER = os.getenv("HOME") .. "/dotfiles/.config/rex/sessionizer.sh"

-- cwd of the focused pane (tmux: #{pane_current_path})
-- Uses the foreground process's cwd, since pwd is empty unless the shell reports
local function pane_cwd(ctx)
	local r = rex.block.call(TERMINAL, "process", { block_id = ctx.block_id })
	local fg = r and r.foreground
	if fg and fg.cwd then
		return fg.cwd
	end
	local p = rex.block.call(TERMINAL, "pwd", { block_id = ctx.block_id })
	p = p and p.pwd
	if not p then
		return nil
	end
	p = p:gsub("^file://[^/]*", "")
	return (p:gsub("%%(%x%x)", function(h)
		return string.char(tonumber(h, 16))
	end))
end

local function new_window(ctx, layout)
	local w, err = rex.session.new_window({ session_id = ctx.session_id, layout = layout, focus = true })
	if not w then
		error("new_window: " .. tostring(err), 0)
	end
	if w.window_id then
		rex.session.focus_window({ session_id = ctx.session_id, window_id = w.window_id })
	end
	if w.block_ids and w.block_ids[1] then
		rex.session.focus_block({ session_id = ctx.session_id, block_id = w.block_ids[1] })
	end

	rex.exec({ "sleep", "0.1" })
	local view = rex.session.view({ session_id = ctx.session_id })
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

-- open GitHub
rex.bind("ctrl+s>g", function(ctx)
	local r = rex.exec({ "git", "remote", "get-url", "origin" }, { cwd = pane_cwd(ctx) })
	if not (r and r.ok) then
		rex.log("warn", "open-github: not a git repo or no origin remote")
		return true
	end
	local url = (r.stdout:gsub("%s+$", ""))
	local host, path = url:match("^git@([^:]+):(.+)$")
	if host then
		url = "https://" .. host .. "/" .. path
	end
	rex.exec({ "open", url })
	return true
end)

-- new window with zsh
rex.action({
	name = "new_tab_with_zsh",
	title = "New zsh Tab in Current Directory",
	run = function(ctx)
		new_window(
			ctx,
			rex.layout.block({
				flavor = SHELL,
				options = { cwd = pane_cwd(ctx), command = { "/bin/zsh" }, shell = "none" },
			})
		)
	end,
})

-- project sessionizer (floating pane)
rex.action({
	name = "open_project_sessionizer",
	title = "Open Project Sessionizer",
	run = function(ctx)
		rex.session.new_layer({
			session_id = ctx.session_id,
			bounds = { 0.15, 0.15, 0.7, 0.7 },
			layout = rex.layout.block({
				flavor = SHELL,
				options = { command = { SESSIONIZER }, shell = "none" },
			}),
			focus = true,
		})
	end,
})

-- session list
rex.bind("ctrl+s>s", "session.switch")
rex.bind("ctrl+s>f", "open_project_sessionizer")
rex.bind("ctrl+s>ctrl+s", "pane.send_key", { key = "ctrl+s" })

-- new window with default shell
rex.bind("ctrl+s>c", "client.tab.new")

rex.bind("ctrl+s>z", "new_tab_with_zsh")
rex.bind("ctrl+s>a", "client.sidebar.activity.toggle")

rex.bind("ctrl+s>h", "pane.focus", { direction = "left" })
rex.bind("ctrl+s>j", "pane.focus", { direction = "down" })
rex.bind("ctrl+s>k", "pane.focus", { direction = "up" })
rex.bind("ctrl+s>l", "pane.focus", { direction = "right" })
rex.bind("ctrl+s>m", "pane.zoom")

-- go to tab
for i = 1, 9 do
	rex.bind("ctrl+s>" .. i, "client.tab.goto", { index = i })
end
