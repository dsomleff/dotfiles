return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"rafamadriz/friendly-snippets", -- for snippets
	},

	config = function()
		local function preserve_cursor_position(callback)
			local last_cursor_pos = vim.api.nvim_win_get_cursor(0)

			if callback then
				callback()
			end

			vim.defer_fn(function()
				if last_cursor_pos then
					local current_line_count = vim.api.nvim_buf_line_count(0)
					local safe_line = math.min(last_cursor_pos[1], current_line_count)
					local safe_col = math.min(last_cursor_pos[2], #vim.api.nvim_get_current_line())

					vim.api.nvim_win_set_cursor(0, { safe_line, safe_col })
				end
			end, 10)
		end

		-- Get LSP capabilities from blink.cmp
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"css_variables",
				"html",
				"jsonls",
				"eslint",
				"harper_ls", -- markdown
				"taplo", -- toml
				"volar",
				"yamlls",
				"golangci_lint_ls",
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
		})

		-- Add a global handler for potential cursor-moving LSP operations
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				preserve_cursor_position()
			end,
		})

		-- Increase LSP timeout to handle slow operations
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			update_in_insert = true,
			virtual_text = {
				spacing = 4,
				prefix = "●",
			},
			timeout = 2000,
		})

		-- LSP Keymappings
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set({ "n", "v" }, "<F2>", vim.lsp.buf.rename, {})
	end,
}
