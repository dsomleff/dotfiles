local MiniPick = require("mini.pick")

MiniPick.setup({
	window = {
		config = function()
			local height = math.floor(0.618 * vim.o.lines)
			local width = math.floor(0.618 * vim.o.columns)
			return {
				anchor = "NW",
				height = height,
				width = width,
				row = math.floor(0.5 * (vim.o.lines - height)) - 1,
				col = math.floor(0.5 * (vim.o.columns - width)),
			}
		end,
	},
	mappings = {
		scroll_left = "<C-h>",
		scroll_down = "<C-d>",
		scroll_up = "<C-k>",
		scroll_right = "<C-l>",
	},
})

vim.ui.select = MiniPick.ui_select

require("mini.extra").setup()

local keymap = vim.keymap.set

keymap("n", "<C-p>", "<cmd>Pick files<cr>")
keymap("n", "<leader>fh", "<cmd>Pick help<cr>")
keymap("n", "<leader>fb", "<cmd>Pick buffers<cr>")
keymap("n", "<leader>fr", "<cmd>Pick resume<cr>")

keymap("n", "<leader>fo", "<cmd>Pick oldfiles<cr>")
keymap("n", "<leader>fk", "<cmd>Pick keymaps<cr>")
keymap("n", "<leader>fd", "<cmd>Pick diagnostic<cr>")
keymap("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end)
keymap("n", "<leader>/", "<cmd>Pick buf_lines scope='current'<cr>")

keymap("n", "<leader>fg", "<cmd>Pick grep_live<cr>")
keymap("n", "<leader>fw", "<cmd>Pick grep pattern='<cword>'<cr>")
keymap("n", "<leader>fW", "<cmd>Pick grep pattern='<cWORD>'<cr>")
