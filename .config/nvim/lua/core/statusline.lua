local frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local i_frame = 0
local active_progress = {}

-- uncomment if vim.lsp.status() is in use
-- vim.api.nvim_create_autocmd("LspProgress", {
-- 	callback = function()
-- 		vim.cmd("redrawstatus")
-- 	end,
-- })

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(args)
		local client_id = args.data.client_id
		local params = args.data.params
		local value = params and params.value

		if not value then
			return
		end

		local token = params.token or "default"
		local key = string.format("%d:%s", client_id, tostring(token))

		if value.kind == "end" or (value.percentage and value.percentage >= 100) then
			active_progress[key] = nil
		else
			local client = vim.lsp.get_client_by_id(client_id)
			local client_name = client and client.name or "LSP"
			local title = value.title or client_name
			local percent = value.percentage and string.format(" %d%%%%", value.percentage) or ""

			i_frame = (i_frame % #frames) + 1
			active_progress[key] = string.format("%s %s%s", frames[i_frame], title, percent)
		end

		vim.cmd("redrawstatus")
	end,
})

local StatusLine = {}

-- local function git_branch()
-- 	local gsd = vim.b.gitsigns_status_dict
-- 	if not gsd or not gsd.head or gsd.head == "" then
-- 		return ""
-- 	end
-- 	return string.format("%%#StatusLineGit#  %s %%*", gsd.head)
-- end

local function file_path()
	local filename = vim.fn.expand("%:~:.")
	if filename == "" then
		filename = "[No Name]"
	end

	return string.format(" %s %%h%%w%%m%%r ", filename)
end

-- local function git_diff()
-- 	local gsd = vim.b.gitsigns_status_dict
-- 	if not gsd then
-- 		return ""
-- 	end
--
-- 	local diff = {}
-- 	if (gsd.added or 0) > 0 then
-- 		table.insert(diff, string.format("%%#StatusLineGitDiffAdded#+%d%%*", gsd.added))
-- 	end
-- 	if (gsd.changed or 0) > 0 then
-- 		table.insert(diff, string.format("%%#StatusLineGitDiffChanged#~%d%%*", gsd.changed))
-- 	end
-- 	if (gsd.removed or 0) > 0 then
-- 		table.insert(diff, string.format("%%#StatusLineGitDiffRemoved#-%d%%*", gsd.removed))
-- 	end
--
-- 	if #diff == 0 then
-- 		return " "
-- 	end
-- 	return " " .. table.concat(diff, " ") .. " "
-- end

local function diagnostics()
	local status = vim.diagnostic.status()
	if status == "" then
		return ""
	end
	return status .. " "
end

local function lsp_progress()
	local items = {}
	for _, text in pairs(active_progress) do
		table.insert(items, text)
	end
	if #items == 0 then
		return ""
	end
	return " " .. table.concat(items, " ") .. " "
end

-- 5. Right Side Helpers
local function filetype()
	local ft = vim.bo.filetype ~= "" and vim.bo.filetype or "no ft"
	return " " .. ft .. " |"
end

local function cursor_stats()
	-- return "  %l:%c %P of %L"
	return " %l:%c %P of %L" -- 
end

-- Assembly
StatusLine.active = function()
	return table.concat({
		-- git_branch(),
		file_path(),
		-- git_diff(),
		diagnostics(),
		"%=",
		-- vim.lsp.status(),
		lsp_progress(),
		filetype(),
		cursor_stats(),
	})
end

_G.StatusLine = StatusLine
vim.opt.statusline = "%!v:lua.StatusLine.active()"
