local keymap = vim.keymap.set

-- =========================
-- Leader keys
-- =========================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =========================
-- File navigation
-- =========================
keymap("n", "<leader>fv", vim.cmd.Ex)
keymap("n", "<leader>pv", "<cmd>e .<CR>")

-- =========================
-- Select and drag up or down
-- =========================
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- =========================
-- Cursor position
-- =========================
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "j", "gj")
keymap("n", "k", "gk")

-- Preserve jumplist when navigating search results
keymap("n", "n", ":keepjumps normal! n<CR>")
keymap("n", "N", ":keepjumps normal! N<CR>")

-- =========================
-- Copy / paste
-- =========================
keymap("x", "<leader>p", [["_dP]]) -- paste without overwriting register
keymap({ "n", "v" }, "<leader>y", [["+y]]) -- copy to system clipboard
keymap("n", "<leader>Y", [["+Y]])

-- Delete into void
keymap({ "n", "v" }, "<leader>d", [["_d]])
keymap({ "n", "x" }, "<leader>x", [["_x]])

-- always use C-c for Esc
keymap("i", "<C-c>", "<Esc>")

-- =========================
-- Miscellaneous
-- =========================
keymap("n", "Q", "<nop>") -- prevent big Q
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Window navigation
keymap("n", "<c-k>", "<C-w>k")
keymap("n", "<c-j>", "<C-w>j")
keymap("n", "<c-h>", "<C-w>h")
keymap("n", "<c-l>", "<C-w>l")

-- Select all
keymap("n", "[a", "gg<S-v>G")
keymap("n", "]a", "gg<S-v>G")

-- Visual mode tabbing
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Close buffers
keymap("n", "<leader>w", "<cmd>bd<CR>") -- close current buffer
keymap("n", "<leader>q", "<cmd>bd!<CR>") -- force close current buffer
keymap("n", "<leader>Q", "<cmd>bufdo bd<CR>") -- close all buffers

-- Disable arrow keys
keymap("n", "<Up>", "<NOP>")
keymap("n", "<Down>", "<NOP>")
keymap("n", "<Left>", "<NOP>")
keymap("n", "<Right>", "<NOP>")

-- Paste below the current line while keeping the cursor
keymap("n", "<leader>P", function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.cmd("put")
	vim.api.nvim_win_set_cursor(0, { row + 1, col })
end)

-- =========================
-- Fzf Lua
-- =========================
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
