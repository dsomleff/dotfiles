local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd
local formatting = create_augroup("AutoFormatting")
local general = create_augroup("General")

-- tree view in netrw
vim.g.netrw_liststyle = 0

-- disable auto-comments on new line
autocmd("BufEnter", {
	group = general,
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Activate Matchit plugin
vim.cmd("runtime macros/matchit.vim")

-- remove white space at the end of a line and format on save
autocmd("BufWritePre", {
	group = formatting,
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
		vim.cmd([[%s/\s\+$//e]])
	end,
})

autocmd("BufWritePre", {
	group = "AutoFormatting",
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- open Netrw after no open buffers left
autocmd("BufEnter", {
	group = general,
	callback = function()
		if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
			vim.cmd("Explore")
		end
	end,
})

-- highlight on yank
autocmd("TextYankPost", {
	callback = vim.schedule_wrap(function()
		vim.highlight.on_yank()
	end),
})

-- Set bufhidden=delete for fugitive buffers after reading
autocmd({ "BufReadPost" }, {
	pattern = "fugitive://*",
	command = "set bufhidden=delete",
})

-- Add relative numbers into Netrw
-- vim.api.nvim_create_augroup("NetrwSettings", { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = "NetrwSettings",
-- 	pattern = "netrw",
-- 	callback = function()
-- 		vim.opt_local.relativenumber = true
-- 	end,
-- })
