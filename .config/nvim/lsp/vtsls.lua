local vscode_tsdk_path_template = "/Applications/%s/Contents/Resources/app/extensions/node_modules/typescript/lib"

local vscode_apps = {
	"Visual Studio Code.app",
	"Visual Studio Code - Insiders.app",
}

local function find_global_tsdk()
	-- Try all known VS Code installations
	for _, app in ipairs(vscode_apps) do
		local path = vscode_tsdk_path_template:format(app)
		if vim.fn.isdirectory(path) == 1 then
			return path
		end
	end

	-- Fallback: Check global npm typescript
	local npm_root = vim.fn.trim(vim.fn.system("npm root -g"))
	local global_tsdk = npm_root .. "/typescript/lib"

	if vim.fn.isdirectory(global_tsdk) == 1 then
		return global_tsdk
	end

	-- Notify user if no TypeScript found
	-- vim.schedule(function()
	-- 	vim.notify("[vtsls] No global TypeScript found. Falling back to workspace version.", vim.log.levels.WARN)
	-- end)

	return nil
end

-- Pre-compute the path ONCE here:
local GLOBAL_TSDK_PATH = find_global_tsdk()

local jsts_settings = {
	suggest = { completeFunctionCalls = true },
	inlayHints = {
		functionLikeReturnTypes = { enabled = true },
		parameterNames = { enabled = "literals" },
		variableTypes = { enabled = true },
	},
}

return {
	cmd = { "vtsls", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = function(bufnr, cb)
		local fname = vim.uri_to_fname(vim.uri_from_bufnr(bufnr))

		local ts_root = vim.fs.find("tsconfig.json", { upward = true, path = fname })[1]
		local git_root = vim.fs.find(".git", { upward = true, path = fname })[1]

		if git_root then
			cb(vim.fn.fnamemodify(git_root, ":h"))
		elseif ts_root then
			cb(vim.fn.fnamemodify(ts_root, ":h"))
		end
	end,
	settings = {
		typescript = jsts_settings,
		javascript = jsts_settings,
		vtsls = {
			typescript = {
				globalTsdk = GLOBAL_TSDK_PATH, -- ← already calculated
			},
			autoUseWorkspaceTsdk = true,
			experimental = {
				maxInlayHintLength = 30,
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
	},
}
