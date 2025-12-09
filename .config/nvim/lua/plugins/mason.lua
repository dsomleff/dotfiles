local ensure_installed = {
	"lua-language-server",
	"typescript-language-server",
	"html-lsp",
	"css-lsp",
	"json-lsp",
	"eslint-lsp",
	"harper-ls", -- spell checker
	"taplo", -- toml
	"yaml-language-server",
	"bash-language-server",
	"prettier",
	"prettierd",
	"stylua",
	"tailwindcss-language-server",
	-- "vtsls",
	--    "vue-language-server"
}

return {
	"mason-org/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
			auto_update = true,
			run_on_start = true,
			start_delay = 3000,
		})
	end,
}
