return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {
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
	},
	keys = {
		{ "<C-p>", "<cmd>FzfLua files<cr>", { desc = "FzfLua | Files", silent = true } },
		{ "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "FzfLua | Help", silent = true } },
		{ "<leader>fg", "<cmd>FzfLua live_grep_native<cr>", { desc = "FzfLua | Word", silent = true } },
		{
			"<leader>fo",
			"<cmd>FzfLua oldfiles<cr>",
			{ desc = "FzfLua | Recent Files", silent = true },
		},
		{
			"<leader>fd",
			"<cmd>FzfLua diagnostics_document<cr>",
			{ desc = "FzfLua | Diagnostics", silent = true },
		},
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "FzfLua | Buffers", silent = true } },
		{ "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", desc = "FzfLua | Code Actions" },
		{ "<leader>fc", "<cmd>FzfLua files cwd=~/dotfiles/.config<cr>", desc = "FzfLua | Config" },
		{ "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "FzfLua | Word Under Cursor" },
		{ "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", desc = "FzfLua | WORD Under Cursor" },
		{
			"<leader>fl",
			"<cmd>FzfLua grep_visual<cr>",
			mode = "v",
			desc = "FzfLua | Search by selection",
		},
		{ "<leader>bi", "<cmd>FzfLua builtin<cr>", desc = "FzfLua | List of finders" },
		{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "FzfLua | List of keymaps" },
		{ "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "FzfLua | Open previous search" },
		{ "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "FzfLua | Grep current file" },
	},
}
