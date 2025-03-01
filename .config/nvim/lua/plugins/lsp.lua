return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"rafamadriz/friendly-snippets", -- for snippets
		"j-hui/fidget.nvim",
	},

	config = function()
		-- Get LSP capabilities from blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("fidget").setup({})
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"cssls",
				"html",
				"jsonls",
				"eslint",
				"harper_ls", -- markdown
				"taplo", -- toml
				"volar",
				"yamlls",
			},
			handlers = {
				function(server_name)
					local server_config = { capabilities = capabilities }

					if server_name == "volar" then
						server_config.filetypes = { "vue", "typescript", "javascript" }
					end

					require("lspconfig")[server_name].setup(server_config)
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,

				["volar"] = function()
					require("lspconfig").volar.setup({
						capabilities = capabilities,
						filetypes = { "vue", "javascript", "typescript" },
						init_options = {
							vue = {
								hybridMode = false,
							},
						},
						on_attach = function(client)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
						end,
					})
				end,
				["harper_ls"] = function()
					require("lspconfig").harper_ls.setup({
						capabilities = capabilities,
						filetypes = { "markdown" },
						on_attach = function(client)
							client.server_capabilities.documentFormattingProvider = true
						end,
					})
				end,
				["yamlls"] = function()
					require("lspconfig").yamlls.setup({
						capabilities = capabilities,
						filetypes = { "yaml" },
						on_attach = function(client)
							client.server_capabilities.documentFormattingProvider = true
						end,
						settings = {
							yaml = {
								format = {
									enable = true,
								},
							},
						},
					})
				end,
			},
		})

		-- Diagnostic configuration
		vim.diagnostic.config({
			update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
			virtual_text = {
				spacing = 4,
				prefix = "●",
			},
		})

		-- LSP Keymappings
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set({ "n", "v" }, "<F2>", vim.lsp.buf.rename, {})
	end,
}
