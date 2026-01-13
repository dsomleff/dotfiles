vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
		data = {
			on_update = function()
				vim.cmd("TSUpdate")
			end,
		},
	},
})

local parsers = {
	"bash",
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"query",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}
require("nvim-treesitter.config").setup({
	ensure_installed = parsers,
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

local function packchanged(event)
	local after = event.data.spec.data and event.data.spec.data.after
	if not after then
		return
	end

	local pkg_name = event.data.spec.name

	local retries = 0
	local function wait()
		if retries > 20 then
			return
		end
		retries = retries + 1

		package.loaded[pkg_name] = nil
		local ok, _ = pcall(require, pkg_name)

		if ok then
			if type(after) == "function" then
				after()
			elseif type(after) == "string" then
				pcall(vim.cmd, after)
			end
		else
			vim.defer_fn(wait, 50)
		end
	end

	wait()
end

vim.api.nvim_create_autocmd("packchanged", { callback = packchanged })
