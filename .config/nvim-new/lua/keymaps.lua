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
keymap("x", "<leader>p", [["_dP]])          -- paste without overwriting register
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
keymap("n", "Q", "<nop>")                  -- prevent big Q
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
keymap("n", "<leader>w", "<cmd>bd<CR>")     -- close current buffer
keymap("n", "<leader>q", "<cmd>bd!<CR>")    -- force close current buffer
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
-- Fugitive keymaps
-- =========================
vim.keymap.set("n", "<leader>gs", "<cmd>G | only<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gp", "<cmd>G pull<CR>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gP", "<cmd>G push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gf", "<cmd>G fetch<CR>", { desc = "Git fetch" })
vim.keymap.set("n", "<leader>gD", ":G branch -D ", { desc = "Delete branch" })
vim.keymap.set("n", "<leader>gH",
  "<cmd>G log --oneline --decorate --graph --parents --all<CR>",
  { desc = "Git history" }
)
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiff<CR>", { desc = "Git diff" })
vim.keymap.set("n", "<leader>mc", "<cmd>Gvdiffsplit!<CR>", { desc = "Merge conflict" })

-- Diff helpers
vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>", { desc = "Get left hunk" })
vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>", { desc = "Get right hunk" })

-- =========================
-- Gitsigns keys
-- =========================
vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
vim.keymap.set({ "n", "v" }, "<leader>gbb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })
vim.keymap.set({ "n", "v" }, "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev hunk" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff this" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
