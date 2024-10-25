return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"tsserver",
				"css_variables",
				"html",
				"jsonls",
				"eslint",
				"prosemd_lsp", -- markdown
				"taplo", -- toml
				"volar",
				"yamlls",
				"golangci_lint_ls",
			},
			handlers = {
				function(server_name)
					local server_config = {}

					if server_name == "volar" then
						server_config.filetypes = { "vue", "typescript", "javascript" }
					end

					require("lspconfig")[server_name].setup({
						-- capabilities = capabilities
						server_config,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
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
					})
				end,
			},

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					--["<Tab>"] =  cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{
						name = "buffer",
						option = {
							dictionary = {},
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
							update_dictionary = function(bufnrs)
								local dict = {}
								for _, bufnr in ipairs(bufnrs) do
									local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

									for _, line in ipairs(lines) do
										for word in vim.split(line, { sep = "%s" }) do
											dict[word] = { word, vim.api.nvim_buf_get_name(bufnr) }
										end
									end
								end
								return dict
							end,
						},
					},
					{ name = "path" },
				}),
			}),

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
			}),
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

		vim.keymap.set({ "n", "v" }, "<F2>", vim.lsp.buf.rename, {})
	end,
}
