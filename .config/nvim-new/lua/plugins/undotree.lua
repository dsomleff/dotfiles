vim.pack.add({
	{
		src = "https://github.com/mbbill/undotree",
		opt = true,
	},
})

local function undotree()
	vim.cmd.packadd("undotree")
end

vim.keymap.set("n", "<leader>u", function()
	undotree()
	vim.cmd.UndotreeToggle()
end, { desc = "Toggle UndoTree" })
