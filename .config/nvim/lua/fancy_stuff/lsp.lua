return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
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
					require("lspconfig")[server_name].setup({ capabilities = capabilities })
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								format = {
									enable = false,
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
				["ts_ls"] = function()
					require("lspconfig").ts_ls.setup({
						capabilities = capabilities,
						on_attach = function(client)
							client.server_capabilities.documentFormattingProvider = false
						end,
						settings = {
							typescript = {
								inlayHints = {
									includeInlayParameterNameHints = "none",
									includeInlayParameterNameHintsWhenArgumentMatchesName = true,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = false,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayEnumMemberValueHints = true,
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
				-- source = "always",
				header = "",
				prefix = "",
			},
			virtual_text = {
				spacing = 4,
				prefix = "●",
			},
		})

		local group = vim.api.nvim_create_augroup("LspMappings", { clear = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = group,
			callback = function(args) -- args is available here
				local map = vim.keymap.set
				local opts = { buffer = args.buf, silent = true }

				-- Inlay Hint Keymaps
				map("n", "<leader>he", function()
					vim.lsp.inlay_hint.enable(true)
					print("Inlay hints enabled")
				end, { noremap = true, silent = true, desc = "Enable inlay hints" })

				map("n", "<leader>hd", function()
					vim.lsp.inlay_hint.enable(false)
					print("Inlay hints disabled")
				end, { noremap = true, silent = true, desc = "Disable inlay hints" })

				-- LSP Keymaps
				map("n", "K", vim.lsp.buf.hover, opts)
				map("n", "gd", vim.lsp.buf.definition, opts)
				map("n", "gr", vim.lsp.buf.references, opts)
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				map("n", "gl", function()
					vim.diagnostic.open_float({ focusable = true })
				end, opts)
			end,
		})
	end,
}
