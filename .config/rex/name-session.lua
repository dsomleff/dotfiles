local HOME = os.getenv("HOME")
local named = {} -- session_id -> true once renamed

---@meta
---@diagnostic disable: undefined-global
rex.on("terminal.pwd_changed", function(ctx, ev)
	if named[ctx.session_id] then
		return
	end

	local path = (ev.pwd:gsub("^file://[^/]*", ""))
	path = path:gsub("%%(%x%x)", function(h)
		return string.char(tonumber(h, 16))
	end)
	path = path:gsub("/+$", "")

	if path == "" or path == HOME then
		return
	end
	local ok, err = rex.session.set_label({ label = path:match("([^/]+)$") })
	if ok then
		named[ctx.session_id] = true
	else
		rex.log("warn", err or "set_label failed")
	end
end)
