-- inspired by https://github.com/gmr458/nvim/blob/master/lua/gmr/core/statusline.lua
local statusline_augroup = vim.api.nvim_create_augroup("gmr_statusline", { clear = true })

local function get_lsp_diagnostics_count(severity)
	if not vim.lsp then
		return 0
	end

	return #vim.diagnostic.get(0, { severity = severity })
end

local function get_git_diff(type)
	local gsd = vim.b.gitsigns_status_dict
	if gsd and gsd[type] then
		return gsd[type]
	end

	return 0
end

local function diagnostics(severity, icon, hl)
	local count = get_lsp_diagnostics_count(severity)
	if count > 0 then
		return string.format("%%#%s# %s%s%%*", hl, count, icon)
	end
	return ""
end

local function git_diff(type, symbol, hl)
	local count = get_git_diff(type)
	if count > 0 then
		return string.format("%%#%s#%s%s%%*", hl, symbol, count)
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

local function status_left()
	local full = ""
	local space = "%#StatusLineMedium# %*"

	local branch = git_branch()
	if branch ~= "" then
		local icon = git_branch_icon()
		full = full .. "%#StatusLineGitBranchBg# " .. icon .. " " .. branch .. " %*"
	end

	local filepath = "%#StatusLineFileNameBg# %f%m%r %*" -- to display only filename use %t instead of %f

	full = full .. filepath .. space

	for _, diff in ipairs({
		{ "added", "+", "StatusLineGitDiffAdded" },
		{ "changed", "~", "StatusLineGitDiffChanged" },
		{ "removed", "-", "StatusLineGitDiffRemoved" },
	}) do
		local part = git_diff(diff[1], diff[2], diff[3])
		if part ~= "" then
			full = full .. part .. space
		end
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
		status_left(),
		diagnostics(vim.diagnostic.severity.ERROR, "e", "StatusLineLspError"),
		diagnostics(vim.diagnostic.severity.WARN, "w", "StatusLineLspWarn"),
		diagnostics(vim.diagnostic.severity.HINT, "h", "StatusLineLspHint"),
		diagnostics(vim.diagnostic.severity.INFO, "i", "StatusLineLspInfo"),
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
		"fugitive",
		"oil",
	},
	callback = function()
		vim.opt_local.statusline = "%!v:lua.StatusLine.inactive()"
	end,
})
