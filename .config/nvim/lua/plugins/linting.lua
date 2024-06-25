return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			vue = { "eslint_d" },
		}

		local function has_eslint_config()
			local configs = { ".eslintrc.js", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml", ".eslintignore" }
			for _, config in ipairs(configs) do
				if vim.fn.filereadable(config) == 1 then
					return true
				end
			end
			return false
		end

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "InsertLeave" }, { -- BufEnter, BufWritePost
			group = lint_augroup,
			callback = function()
				if has_eslint_config() then
					lint.try_lint()
					-- else
					-- 	vim.notify("", vim.log.levels.INFO)
				end
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			if has_eslint_config() then
				lint.try_lint()
				-- else
				-- 	vim.notify("", vim.log.levels.INFO)
			end
		end, { desc = "Trigger linting for current file" })
	end,
}
