vim.lsp.enable({
	"bash_ls",
	"css_ls",
	"eslint_ls",
	"go_lsp",
	"harper_ls",
	"html_ls",
	"json_ls",
	"lua_ls",
	"nushell",
	"tailwindcss_ls",
	"taplo", -- toml
	"ts_ls",
	"yaml_ls",
	-- "vtsls", -- must be installed via Mason
	-- "vue_ls", -- must be installed via Mason
	"biome",
})

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end, { silent = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true })
vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float({ focusable = true })
end, { silent = true })

-- inlay hint toggle
if vim.lsp.inlay_hint then
	vim.keymap.set("n", "<Space>ih", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, { desc = "Toggle Inlay Hints", silent = true })
end

vim.diagnostic.config({
	-- virtual_text = { current_line = true },
	virtual_lines = { current_line = true },
})
