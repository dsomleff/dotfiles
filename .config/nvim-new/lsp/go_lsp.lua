return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			codelenses = {
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			analyses = {
				unusedvariable = true,
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
}
