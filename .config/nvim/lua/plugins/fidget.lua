vim.api.nvim_create_autocmd("LspAttach", {
	once = true,
	callback = function()
		require("fidget").setup({
			notification = {
				window = {
					winblend = 0,
				},
			},
		})
	end,
})
