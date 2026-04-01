local MiniComp = require("mini.completion")
local gen_loader = require("mini.snippets").gen_loader

MiniComp.setup({
	window = {
		info = { height = 25, width = 80, border = "single" },
		signature = { height = 25, width = 80, border = "single" },
	},
	lsp_completion = { source_func = "omnifunc", auto_setup = false },
	mappings = {
		scroll_down = "<C-d>",
		scroll_up = "<C-u>",
	},
	fallback_action = "<C-n>",
})

local on_attach = function(args)
	vim.bo[args.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
end
vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })
vim.lsp.config("*", { capabilities = MiniComp.get_lsp_capabilities() })

require("mini.snippets").setup({
	snippets = {
		gen_loader.from_file("~/dotfiles/.config/nvim/snippets/*.json"),
		gen_loader.from_lang(),
	},
	mappings = {
		expand = "<C-j>",
		jump_next = "<C-l>",
		jump_prev = "<C-h>",
		stop = "<C-c>",
	},
})
