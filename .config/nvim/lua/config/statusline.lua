-- inspired by https://github.com/gmr458/nvim/blob/master/lua/gmr/core/statusline.lua
local statusline_augroup = vim.api.nvim_create_augroup("gmr_statusline", { clear = true })

local filetype_icons = {
	lua = "",
	javascript = "",
	typescript = "",
	typescriptreact = "",
	html = "",
	css = "",
	scss = "",
	json = "",
	bash = "",
	sh = "",
	dockerfile = "󰡨",
	markdown = "󰫺",
	fugitive = "",
	gitcommit = "",
	netrw = "",
	oil = "",
}

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
		local iconMain = ""
		return iconMain .. string.format("%%#%s# %s%s%%*", hl, count, icon)
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

local function full_git()
	local full = ""
	local space = "%#StatusLineMedium# %*"

	local branch = git_branch()
	if branch ~= "" then
		local icon = git_branch_icon()
		full = full .. "%#StatusLineGitBranchBg# " .. icon .. " " .. branch .. " %*"
	end

	local filepath = "%#StatusLineFileNameBg#  %t %*"
	full = full .. filepath .. space

	local git_icon = ""
	local git_info = ""

	for _, diff in ipairs({
		{ "added", "+", "StatusLineGitDiffAdded" },
		{ "changed", "~", "StatusLineGitDiffChanged" },
		{ "removed", "-", "StatusLineGitDiffRemoved" },
	}) do
		local part = git_diff(diff[1], diff[2], diff[3])
		if part ~= "" then
			git_info = git_info .. part .. space
		end
	end

	if git_info ~= "" then
		full = full .. "%#StatusLineMedium# " .. git_icon .. " %*" .. git_info
	end

	return full
end

-- Fidget replacement
-- local function lsp_active()
-- 	if not rawget(vim, "lsp") then
-- 		return ""
-- 	end
--
-- 	local current_buf = vim.api.nvim_get_current_buf()
-- 	local clients = vim.lsp.get_clients({ bufnr = current_buf })
--
-- 	local space = "%#StatusLineMedium# %*"
--
-- 	if #clients > 0 then
-- 		return space .. "%#StatusLineMedium#LSP%*"
-- 	end
--
-- 	return ""
-- end
--
-- local lsp_progress = {
-- 	client = nil,
-- 	kind = nil,
-- 	title = nil,
-- 	percentage = nil,
-- 	message = nil,
-- }
--
-- vim.api.nvim_create_autocmd("LspProgress", {
-- 	group = statusline_augroup,
-- 	desc = "Update LSP progress in statusline",
-- 	pattern = { "begin", "report", "end" },
-- 	callback = function(args)
-- 		if not (args.data and args.data.client_id) then
-- 			return
-- 		end
--
-- 		lsp_progress = {
-- 			client = vim.lsp.get_client_by_id(args.data.client_id),
-- 			kind = args.data.params.value.kind,
-- 			message = args.data.params.value.message,
-- 			percentage = args.data.params.value.percentage,
-- 			title = args.data.params.value.title,
-- 		}
--
-- 		if lsp_progress.kind == "end" then
-- 			lsp_progress.title = nil
-- 			vim.defer_fn(function()
-- 				vim.cmd.redrawstatus()
-- 			end, 500)
-- 		else
-- 			vim.cmd.redrawstatus()
-- 		end
-- 	end,
-- })
--
-- local function lsp_status()
-- 	if not rawget(vim, "lsp") then
-- 		return ""
-- 	end
--
-- 	if vim.o.columns < 120 then
-- 		return ""
-- 	end
--
-- 	if not lsp_progress.client or not lsp_progress.title then
-- 		return ""
-- 	end
--
-- 	local title = lsp_progress.title or ""
-- 	local percentage = (lsp_progress.percentage and (lsp_progress.percentage .. "%%")) or ""
-- 	local message = lsp_progress.message or ""
--
-- 	local lsp_message = string.format("%s", title)
--
-- 	if message ~= "" then
-- 		lsp_message = string.format("%s %s", lsp_message, message)
-- 	end
--
-- 	if percentage ~= "" then
-- 		lsp_message = string.format("%s %s", lsp_message, percentage)
-- 	end
--
-- 	return string.format("%%#StatusLineLspMessages#%s%%* ", lsp_message)
-- end

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
	local ft = vim.bo.filetype or vim.fn.expand("%:e", false)
	local icon = filetype_icons[ft] or ""

	return string.format("%%#%s# %s %s %%*", hlgroup, icon, ft)
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
		diagnostics(vim.diagnostic.severity.ERROR, "e", "StatusLineLspError"),
		diagnostics(vim.diagnostic.severity.WARN, "w", "StatusLineLspWarn"),
		diagnostics(vim.diagnostic.severity.HINT, "h", "StatusLineLspHint"),
		diagnostics(vim.diagnostic.severity.INFO, "i", "StatusLineLspInfo"),
		"%=",
		"%=",
		"%S ",
		formatted_filetype("StatusLineMode"),
		-- lsp_status(),
		-- lsp_active(),
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
