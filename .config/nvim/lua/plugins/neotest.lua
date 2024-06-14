return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",
		"marilari88/neotest-vitest",
	},

	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vitest")({
					filter_dir = function(name)
						return name ~= "node_modules"
					end,
				}),
			},
		})
	end,

	vim.keymap.set("n", "<leader>tn", function()
		require("neotest").run.run()
	end, { desc = "Run nearest test" }),

	vim.keymap.set("n", "<leader>tf", function()
		require("neotest").run.run(vim.fn.expand("%"))
	end, { desc = "Run the current file" }),

	vim.keymap.set("n", "<leader>tl", function()
		require("neotest").run.run_last()
	end, { desc = "Run last executed test" }),

	vim.keymap.set("n", "<leader>ta", function()
		require("neotest").run.run(vim.fn.getcwd())
	end, { desc = "Run all tests" }),

	vim.keymap.set("n", "<leader>tw", function()
		require("neotest").run.run({
			vim.fn.expand("%"),
			vitestCommand = "npx vitest -w",
		})
	end, { desc = "Run Watch File" }),

	vim.keymap.set("n", "<leader>ts", function()
		require("neotest").summary.toggle()
	end, { desc = "Toggle test summary" }),

	vim.keymap.set("n", "<leader>to", function()
		require("neotest").output.open()
	end, { desc = "Show test output" }),

	vim.keymap.set("n", "<leader>tp", function()
		require("neotest").output_panel.toggle()
	end, { desc = "Toggle output panel" }),
}
