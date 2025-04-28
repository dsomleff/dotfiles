local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local map = vim.keymap.set
		local opts = { buffer = args.buf, silent = true }

		-- LSP Keymaps
		map("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end)
		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		-- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		map("n", "gl", function()
			vim.diagnostic.open_float({ focusable = true })
		end, opts)

		if vim.lsp.inlay_hint then
			vim.keymap.set("n", "<Space>ih", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, { desc = "Toggle Inlay Hints" })
		end
	end,
})

vim.lsp.enable({
	"lua_ls",
	-- "ts_ls",
	"html_ls",
	"css_ls",
	"json_ls",
	"eslint_ls",
	"harper_ls",
	"taplo", -- toml
	"yaml_ls",
	"bash_ls",
	"tailwindcss_ls",
	"vtsls",
})
