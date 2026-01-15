local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd
local formatting = create_augroup("AutoFormatting")
local general = create_augroup("General")

-- Activate Matchit plugin to jump with % via html tags
vim.cmd("runtime macros/matchit.vim")

-- remove white space at the end of a line and format on save
autocmd("BufWritePre", {
	group = formatting,
	pattern = "*",
	callback = function()
		local pos = vim.api.nvim_win_get_cursor(0)
		vim.cmd([[%s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, pos)
	end,
})

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
