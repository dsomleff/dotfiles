local StatusLine = {}

local function git_branch()
	local gsd = vim.b.gitsigns_status_dict
	if not gsd or not gsd.head or gsd.head == "" then
		return ""
	end
	return string.format("%%#StatusLineGit#  %s %%*", gsd.head)
end

local function file_path()
	local filename = vim.fn.expand("%:~:.")
	if filename == "" then
		filename = "[No Name]"
	end

	local flags = ""
	if vim.bo.modified then
		flags = flags .. " [+]"
	end
	if vim.bo.readonly then
		flags = flags .. " RO"
	end

	return string.format("%%#StatusLineFile# %s%s %%*", filename, flags)
end

local function git_diff()
	local gsd = vim.b.gitsigns_status_dict
	if not gsd then
		return ""
	end

	local diff = {}
	if (gsd.added or 0) > 0 then
		table.insert(diff, string.format("%%#StatusLineGitDiffAdded#+%d%%*", gsd.added))
	end
	if (gsd.changed or 0) > 0 then
		table.insert(diff, string.format("%%#StatusLineGitDiffChanged#~%d%%*", gsd.changed))
	end
	if (gsd.removed or 0) > 0 then
		table.insert(diff, string.format("%%#StatusLineGitDiffRemoved#-%d%%*", gsd.removed))
	end

	if #diff == 0 then
		return " "
	end
	return " " .. table.concat(diff, " ") .. " "
end

local function diagnostics()
	local status = vim.diagnostic.status()
	if status == "" then
		return ""
	end
	return status .. " "
end

-- 5. Right Side Helpers
local function cursor_stats()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	local total = vim.fn.line("$")
	local percent = math.ceil((line / total) * 100)

	return string.format(
		"%%#StatusLineCursor#  %d:%d %%#StatusLinePercent#%d%%%% %%#StatusLineTotalLines#of %d %%*",
		line,
		col,
		percent,
		total
	)
end

-- Assembly
StatusLine.active = function()
	return table.concat({
		git_branch(),
		file_path(),
		git_diff(),
		diagnostics(),
		"%=",
		string.format("%%#StatusLineFileType# %s %%*", vim.bo.filetype or "no ft"),
		cursor_stats(),
	})
end

_G.StatusLine = StatusLine
vim.opt.statusline = "%!v:lua.StatusLine.active()"
