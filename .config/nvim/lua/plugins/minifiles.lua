local MiniFiles = require("mini.files")

MiniFiles.setup({
	options = {
		use_as_default_explorer = true,
		permanent_delete = false,
	},
	windows = {
		preview = false,
		width_focus = 50,
		width_nofocus = 40,
		width_preview = 50,
		max_number = 2,
	},
})

vim.keymap.set("n", "-", function()
	local path = vim.api.nvim_buf_get_name(0)
	if not MiniFiles.close() then
		MiniFiles.open(vim.uv.fs_stat(path) and path or nil, false)
	end
end, { desc = "Open mini.files (current file dir)" })
