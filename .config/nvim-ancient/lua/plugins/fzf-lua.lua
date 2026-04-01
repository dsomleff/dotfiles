return {
	"ibhagwan/fzf-lua",
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
		files = {
			formatter = "path.filename_first",
			git_icons = false,
			no_header = true,
			cwd_header = false,
			cwd_prompt = false,
			winopts = {
				title = " Find Files ",
				title_pos = "center",
				title_flags = false,
			},
		},
		buffers = {
			formatter = "path.filename_first",
			no_header = true,
			fzf_opts = { ["--delimiter"] = " ", ["--with-nth"] = "-1.." },
			winopts = {
				title = " Buffers ",
				title_pos = "center",
			},
		},
	},
	config = function(_, opts)
		require("fzf-lua").setup(opts)
		require("fzf-lua").register_ui_select()
	end,
	keys = {
		{ "<C-p>", "<cmd>FzfLua files<cr>", desc = "FzfLua | Files" },
		{ "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "FzfLua | Help" },
		{ "<leader>fg", "<cmd>FzfLua live_grep_native<cr>", desc = "FzfLua | Word" },
		{ "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "FzfLua | Recent Files" },
		{ "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "FzfLua | Diagnostics" },
		{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "FzfLua | Buffers" },
		{ "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", desc = "FzfLua | Code Actions" },
		{ "<leader>fc", "<cmd>FzfLua files cwd=~/dotfiles<cr>", desc = "FzfLua | Config" },
		{ "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "FzfLua | Word Under Cursor" },
		{ "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", desc = "FzfLua | WORD Under Cursor" },
		{ "<leader>fl", "<cmd>FzfLua grep_visual<cr>", mode = "v", desc = "FzfLua | Search by selection" },
		{ "<leader>bi", "<cmd>FzfLua builtin<cr>", desc = "FzfLua | List of finders" },
		{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "FzfLua | List of keymaps" },
		{ "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "FzfLua | Open previous search" },
		{ "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>", desc = "FzfLua | Grep current file" },
		{ "<leader>ft", "<cmd>FzfLua treesitter<cr>", desc = "FzfLua | Grep current file" },
	},
}
