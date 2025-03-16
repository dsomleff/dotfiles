return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-jest",
	},

	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-vitest")({
					filter_dir = function(name)
						return name ~= "node_modules"
					end,
				}),
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
			},
		})

		local keymap = vim.keymap.set

		keymap("n", "<leader>tn", function()
			neotest.run.run()
		end, { desc = "Run nearest test" })

		keymap("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Run the current file" })

		keymap("n", "<leader>tl", function()
			neotest.run.run_last()
		end, { desc = "Run last executed test" })

		keymap("n", "<leader>ta", function()
			neotest.run.run(vim.fn.getcwd())
		end, { desc = "Run all tests" })

		keymap("n", "<leader>tw", function()
			neotest.run.run({
				vim.fn.expand("%"),
				vitestCommand = "npx vitest -w",
			})
		end, { desc = "Run Watch File" })

		keymap("n", "<leader>ts", function()
			neotest.summary.toggle()
		end, { desc = "Toggle test summary" })

		keymap("n", "<leader>to", function()
			neotest.output.open()
		end, { desc = "Show test output" })

		keymap("n", "<leader>tp", function()
			neotest.output_panel.toggle()
		end, { desc = "Toggle output panel" })
	end,
}
