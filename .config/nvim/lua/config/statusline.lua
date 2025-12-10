local StatusLine = {}

local function get_git_branch()
	local gitsigns = vim.b.gitsigns_status_dict
	return gitsigns and gitsigns.head or nil
end

local function git_branch()
	local branch = get_git_branch()
	if not branch or branch == "" then
		return ""
	end
	local icon = ""
	return string.format("%%#StatusLineGit# %s %s %%*", icon, branch)
end

local function file_path()
	local filename = vim.fn.expand("%:~:.")
	if filename == "" then
		filename = "[No Name]"
	end

	local flags = ""
	if vim.bo.modified then
		flags = flags .. "[+]"
	end
	if vim.bo.readonly then
		flags = flags .. "RO"
	end

	return string.format("%%#StatusLineFile# %s %s %%*", filename, flags)
end

local function git_diff()
	local gsd = vim.b[0].gitsigns_status_dict
	if not gsd then
		return ""
	end

	local parts = {}

	if gsd.added and gsd.added > 0 then
		table.insert(parts, string.format("%%#StatusLineGitDiffAdded#+%d%%*", gsd.added))
	end
	if gsd.changed and gsd.changed > 0 then
		table.insert(parts, string.format("%%#StatusLineGitDiffChanged#~%d%%*", gsd.changed))
	end
	if gsd.removed and gsd.removed > 0 then
		table.insert(parts, string.format("%%#StatusLineGitDiffRemoved#-%d%%*", gsd.removed))
	end

	if #parts == 0 then
		return ""
	end

	return string.format(" %s ", table.concat(parts, " "))
end

local function get_lsp_diagnostics_count(severity)
	return #vim.diagnostic.get(0, { severity = severity })
end

local function diagnostics(severity, icon, hl)
	local count = get_lsp_diagnostics_count(severity)
	if count > 0 then
		return string.format("%%#%s# %s%s%%*", hl, count, icon)
	end
	return ""
end

local function filetype()
	local ft = vim.bo.filetype or vim.fn.expand("%:e", false)
	if ft == "" then
		ft = "no ft"
	end
	return string.format("%%#StatusLineFileType# %s %%*", ft)
end

local function cursor_position()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	return string.format("%%#StatusLineCursor#  %d:%d %%*", line, col)
end

local function file_percentage()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local total_lines = vim.api.nvim_buf_line_count(0)
	local percent = math.ceil((current_line / total_lines) * 100)
	return string.format("%%#StatusLinePercent# %d%%%% %%*", percent)
end

local function total_lines()
	local lines = vim.fn.line("$")
	return string.format("%%#StatusLineTotalLines# of %d %%*", lines)
end

StatusLine.active = function()
	return table.concat({
		git_branch(),
		file_path(),
		git_diff(),
		diagnostics(vim.diagnostic.severity.ERROR, "e", "StatusLineLspError"),
		diagnostics(vim.diagnostic.severity.WARN, "w", "StatusLineLspWarn"),
		diagnostics(vim.diagnostic.severity.HINT, "h", "StatusLineLspHints"),
		diagnostics(vim.diagnostic.severity.INFO, "i", "StatusLineLspInfo"),
		"%=",
		filetype(),
		cursor_position(),
		file_percentage(),
		total_lines(),
	})
end

_G.StatusLine = StatusLine
vim.opt.statusline = "%!v:lua.StatusLine.active()"
