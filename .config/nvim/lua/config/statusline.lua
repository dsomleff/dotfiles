-- copied from https://github.com/gmr458/nvim/blob/master/lua/gmr/core/statusline.lua
local statusline_augroup = vim.api.nvim_create_augroup("gmr_statusline", { clear = true })

local function get_lsp_diagnostics_count(severity)
	if not rawget(vim, "lsp") then
		return 0
	end

	local count = vim.diagnostic.count(0, { serverity = severity })[severity]
	if count == nil then
		return 0
	end

	return count
end

local function get_git_diff(type)
	local gsd = vim.b.gitsigns_status_dict
	if gsd and gsd[type] then
		return gsd[type]
	end

	return 0
end

local function diagnostics_error()
	local count = get_lsp_diagnostics_count(vim.diagnostic.severity.ERROR)
	if count > 0 then
		return string.format("%%#StatusLineLspError# %se%%*", count)
	end

	return ""
end

local function diagnostics_warns()
	local count = get_lsp_diagnostics_count(vim.diagnostic.severity.WARN)
	if count > 0 then
		return string.format("%%#StatusLineLspWarn# %sw%%*", count)
	end

	return ""
end

local function diagnostics_hint()
	local count = get_lsp_diagnostics_count(vim.diagnostic.severity.HINT)
	if count > 0 then
		return string.format("%%#StatusLineLspHint# %sh%%*", count)
	end

	return ""
end

local function diagnostics_info()
	local count = get_lsp_diagnostics_count(vim.diagnostic.severity.INFO)
	if count > 0 then
		return string.format("%%#StatusLineLspInfo# %si%%*", count)
	end

	return ""
end

local function git_diff_added()
	local added = get_git_diff("added")
	if added > 0 then
		return string.format("%%#StatusLineGitDiffAdded#+%s%%*", added)
	end

	return ""
end

local function git_diff_changed()
	local changed = get_git_diff("changed")
	if changed > 0 then
		return string.format("%%#StatusLineGitDiffChanged#~%s%%*", changed)
	end

	return ""
end

local function git_diff_removed()
	local removed = get_git_diff("removed")
	if removed > 0 then
		return string.format("%%#StatusLineGitDiffRemoved#-%s%%*", removed)
	end

	return ""
end

local function git_branch_icon()
	return "%#StatusLineGitBranchIcon#%*"
end

local function git_branch()
	local branch = vim.b.gitsigns_head

	if branch == "" or branch == nil then
		return ""
	end

	return string.format("%%#StatusLineMedium#%s%%*", branch)
end

local function full_git()
	local full = ""
	local space = "%#StatusLineMedium# %*"

	local branch = git_branch()
	if branch ~= "" then
		local icon = git_branch_icon()
		full = full .. space .. icon .. space .. branch .. space
	end

	local filepath = "%#StatusLineMedium# %t %*"
	full = full .. filepath .. space

	local added = git_diff_added()
	if added ~= "" then
		full = full .. added .. space
	end

	local changed = git_diff_changed()
	if changed ~= "" then
		full = full .. changed .. space
	end

	local removed = git_diff_removed()
	if removed ~= "" then
		full = full .. removed .. space
	end

	return full
end

local function file_percentage()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local lines = vim.api.nvim_buf_line_count(0)

	return string.format("%%#StatusLineMedium#  %d%%%% %%*", math.ceil(current_line / lines * 100))
end

local function total_lines()
	local lines = vim.fn.line("$")
	return string.format("%%#StatusLineMedium#of %s %%*", lines)
end

local function formatted_filetype(hlgroup)
	local filetype = vim.bo.filetype or vim.fn.expand("%:e", false)
	return string.format("%%#%s# %s %%*", hlgroup, filetype)
end

StatusLine = {}

StatusLine.inactive = function()
	return table.concat({
		formatted_filetype("StatusLineMode"),
	})
end

local redeable_filetypes = {
	["qf"] = true,
	["help"] = true,
}

StatusLine.active = function()
	local mode_str = vim.api.nvim_get_mode().mode
	if mode_str == "t" or mode_str == "nt" then
		return table.concat({
			"%=",
			"%=",
			file_percentage(),
			total_lines(),
		})
	end

	if redeable_filetypes[vim.bo.filetype] or vim.o.modifiable == false then
		return table.concat({
			formatted_filetype("StatusLineMode"),
			"%=",
			"%=",
			file_percentage(),
			total_lines(),
		})
	end

	local statusline = {
		full_git(),
		diagnostics_error(),
		diagnostics_warns(),
		diagnostics_hint(),
		diagnostics_info(),
		"%=",
		"%=",
		"%S ",
		formatted_filetype("StatusLineMode"),
		file_percentage(),
		total_lines(),
	}

	return table.concat(statusline)
end

vim.opt.statusline = "%!v:lua.StatusLine.active()"

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FileType" }, {
	group = statusline_augroup,
	pattern = {
		"NvimTree_1",
		"NvimTree",
		"lspinfo",
		"lazy",
		"netrw",
		"mason",
		"qf",
	},
	callback = function()
		vim.opt_local.statusline = "%!v:lua.StatusLine.inactive()"
	end,
})
