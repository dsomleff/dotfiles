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
