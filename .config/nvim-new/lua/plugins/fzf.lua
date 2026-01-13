vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")
local keymap = vim.keymap.set

fzf.setup({
	winopts = {
		preview = {
			layout = "vertical",
		},
	},

	lsp = {
		code_actions = {
			previewer = false,
		},
	},

	files = {
		formatter = "path.filename_first",
		git_icons = false,
		no_header = true,
		cwd_header = false,
		cwd_prompt = false,
		winopts = {
			title_flags = false,
		},
	},

	buffers = {
		formatter = "path.filename_first",
		no_header = true,
		fzf_opts = {
			["--delimiter"] = " ",
			["--with-nth"] = "-1..",
		},
	},
})

fzf.register_ui_select()

keymap("n", "<C-p>", "<cmd>FzfLua files<cr>")
keymap("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>")
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep_native<cr>")
keymap("n", "<leader>fo", "<cmd>FzfLua oldfiles<cr>")
keymap("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>")
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>")
keymap("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>")
keymap("n", "<leader>fc", "<cmd>FzfLua files cwd=~/dotfiles<cr>")
keymap("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>")
keymap("n", "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>")
keymap("n", "<leader>bi", "<cmd>FzfLua builtin<cr>")
keymap("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>")
keymap("n", "<leader>fr", "<cmd>FzfLua resume<cr>")
keymap("n", "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>")
keymap("n", "<leader>ft", "<cmd>FzfLua treesitter<cr>")
keymap("v", "<leader>fl", "<cmd>FzfLua grep_visual<cr>")
