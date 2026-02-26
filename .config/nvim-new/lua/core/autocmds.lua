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
	vim.pack.del({ opts.args })
end, {
	nargs = 1,
	complete = function() end,
})

vim.api.nvim_create_user_command("NvimUpdate", function()
	vim.notify("Updating Neovim components…", vim.log.levels.INFO)

	vim.defer_fn(function()
		vim.cmd("TSUpdate")
		vim.cmd("MasonUpdate")
		vim.cmd("PackUpdate")

		vim.notify("Neovim update finished", vim.log.levels.INFO)
	end, 100)
end, {})

-- Add feat and chore snippets into jj description
vim.api.nvim_create_autocmd("FileType", {
	pattern = "jjdescription",
	callback = function()
		vim.bo.filetype = "gitcommit"
	end,
})
