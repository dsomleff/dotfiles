---@meta
---@diagnostic disable: undefined-global
local HOME = os.getenv("HOME")
local SHELL = "com.superlogical.terminal.shell"
local PROJECT_ROOTS = { HOME .. "/Code", HOME .. "/Pets" }
local FD = "/opt/homebrew/bin/fd"

local function session_label(path)
	return (path:match("[^/]+$"):gsub("%.", "_"))
end

local function open_sessions()
	local open = {}
	local r = rex.call("session.list")
	for _, s in ipairs(r and r.sessions or {}) do
		open[s.label] = s.session_id
	end
	return open
end

local function project_items(open)
	local argv = { FD, ".", "--type", "d", "--min-depth", "1", "--max-depth", "1", "--absolute-path" }
	for _, root in ipairs(PROJECT_ROOTS) do
		argv[#argv + 1] = "--search-path"
		argv[#argv + 1] = root
	end
	local r, err = rex.exec(argv)
	if r == nil or not r.ok then
		error("fd: " .. tostring(err or (r and r.stderr)), 0)
	end

	local items = {}
	for path in r.stdout:gmatch("[^\n]+") do
		path = path:gsub("/$", "")
		local is_open = open[session_label(path)] ~= nil
		items[#items + 1] = {
			id = path,
			title = path:match("[^/]+$"),
			subtitle = path:sub(1, #HOME) == HOME and "~" .. path:sub(#HOME + 1) or path,
			icon = is_open and "terminal" or "folder",
			detail = is_open and "open" or nil,
		}
	end
	table.sort(items, function(a, b)
		if (a.detail ~= nil) ~= (b.detail ~= nil) then
			return a.detail ~= nil
		end
		return a.subtitle < b.subtitle
	end)
	return items
end

rex.action({
	name = "open_project_sessionizer",
	title = "Open Project",
	run = function()
		local open = open_sessions()
		local dir, why = rex.ui.pick({
			title = "Open project",
			placeholder = "Filter projects",
			items = project_items(open),
		})
		if dir == nil then
			if why ~= "cancelled" then
				rex.log("warn", "sessionizer: " .. tostring(why))
			end
			return
		end

		local label = session_label(dir)
		local session_id = open[label]
		if not session_id then
			local created, err = rex.call("session.create", {
				label = label,
				initial_windows = {
					{ layout = rex.layout.block({ flavor = SHELL, options = { cwd = dir } }) },
				},
			})
			if created == nil then
				error("session.create: " .. tostring(err), 0)
			end
			session_id = created.session_id
		end
		rex.client.queue("session.select", { session_id = session_id })
	end,
})
