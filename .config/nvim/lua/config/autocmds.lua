local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd
local formatting = create_augroup("AutoFormatting")
local general = create_augroup("General")

-- disable auto-comments on newline
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
		vim.cmd([[%s/\s\+$//e]])
	end,
})

-- open Netrw after no open buffers left
-- autocmd("BufEnter", {
-- 	group = general,
-- 	callback = function()
-- 		local bufs = vim.tbl_filter(function(buf)
-- 			return vim.fn.buflisted(buf) == 1
-- 		end, vim.api.nvim_list_bufs())
--
-- 		if #bufs == 0 then
-- 			vim.cmd("Explore")
-- 		end
-- 	end,
-- })

-- highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
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

-- Auto-delete undo files older than 30 days on Vim startup
-- autocmd("VimEnter", {
-- 	callback = function()
-- 		local undodir = os.getenv("HOME") .. "/.vim/undodir"
-- 		local days_old = 30
-- 		local cmd = string.format("find %s -type f -mtime +%d -delete", undodir, days_old)
-- 		os.execute(cmd)
-- 	end,
-- })

-- Auto delete No Name buffer + keep the last buffer always open
vim.api.nvim_create_augroup("AutoDeleteNoNameBuffer", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	group = "AutoDeleteNoNameBuffer",
	pattern = "*",
	callback = function()
		local bufsize = #vim.fn.getbufinfo({ buflisted = 1 })
		if bufsize == 2 then
			for _, buf in pairs(vim.fn.getbufinfo({ buflisted = 1 })) do
				if buf.name == "" then
					vim.api.nvim_buf_delete(buf.bufnr, { force = true })
				end
			end
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
