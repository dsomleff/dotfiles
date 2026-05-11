local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd
local general = create_augroup("General")

-- Activate Matchit plugin to jump with % via HTML tags
vim.cmd("runtime macros/matchit.vim")

-- highlight on yank
autocmd("TextYankPost", {
	group = general,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Vim Pack Commands
vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, {})

vim.api.nvim_create_user_command("PackDelete", function(opts)
	local ok, err = pcall(function()
		vim.pack.del({ opts.args })
	end)

	if ok then
		print("Successfully deleted: " .. opts.args)
	else
		vim.notify("Failed to delete " .. opts.args .. ": " .. err, vim.log.levels.ERROR)
	end
end, {
	nargs = 1,
	complete = function(ArgLead)
		local plugins = {}
		for _, path in ipairs(vim.api.nvim_get_runtime_file("pack/*/*/*", true)) do
			local name = vim.fn.fnamemodify(path, ":t")
			if name:match(ArgLead) then
				table.insert(plugins, name)
			end
		end
		return plugins
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

-- Add feat and chore snippets into jj description
vim.api.nvim_create_autocmd("FileType", {
	pattern = "jjdescription",
	callback = function()
		vim.bo.filetype = "gitcommit"
	end,
})

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
	desc = "Show LSP Info",
})

vim.api.nvim_create_user_command("LspLog", function(_)
	local log_path = vim.lsp.log.get_filename()
	vim.cmd.edit(log_path)
	-- Or vim.cmd.tabnew(log_path)
end, {
	desc = "Show LSP log",
})

vim.api.nvim_create_user_command("LspRestart", "lsp restart", {
	desc = "Restart LSP",
})

vim.api.nvim_create_user_command("Path", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
	print("Copied relative path")
end, {})

vim.api.nvim_create_user_command("AbsolutePath", function()
	vim.fn.setreg("+", vim.fn.expand("%:p"))
	print("Copied absolute path")
end, {})

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(ev)
		local value = ev.data.params.value or {}
		if not value.kind then
			return
		end

		local status = value.kind == "end" and 0 or 1
		local percent = value.percentage or 0
		local osc_seq = string.format("\27]9;4;%d;%d\a", status, percent)

		if os.getenv("TMUX") then
			osc_seq = osc_seq:gsub("\27", "\27\27")
			osc_seq = string.format("\27Ptmux;%s\27\\", osc_seq)
		end

		vim.api.nvim_chan_send(vim.v.stderr, osc_seq)
	end,
})
