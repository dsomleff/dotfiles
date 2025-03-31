-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", "<cmd>:e.<CR>")

-- select and drag up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor position
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy/select/paste
-- vim.keymap.set("v", "<leader>P", [["_dP]])

-- copy into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete into void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "x" }, "x", [["_x]])

-- prevent big Q pressing ;)
vim.keymap.set("n", "Q", "<nop>")

-- tmux sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix navigation
-- vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "[Q", "<cmd>cfirst<CR>zz")
-- vim.keymap.set("n", "]Q", "<cmd>clast<CR>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace word globally
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

-- instead of :so
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- navigate vim pane
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Select all
vim.keymap.set("n", "[a", "gg<S-v>G")
vim.keymap.set("n", "]a", "gg<S-v>G")

-- Navigating buffers
-- vim.keymap.set("n", "[b", ":bprevious<CR>")
-- vim.keymap.set("n", "]b", ":bnext<CR>")
-- vim.keymap.set("n", "[B", ":bfirst<CR>")
-- vim.keymap.set("n", "]B", ":blast<CR>")

-- Tab's
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Markdown preview
vim.opt.conceallevel = 2

-- Display LSP hints
vim.keymap.set("n", "<leader>h", function()
	vim.lsp.inlay_hint.enable()
end)

-- Open terminal
vim.keymap.set("n", "<leader>bt", "<cmd>bo te<CR>")

-- Close single open buffer
vim.keymap.set("n", "<leader>w", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>bd!<CR>")

-- Close all open buffers
vim.keymap.set("n", "<leader>Q", "<cmd>bufdo bd<CR>")

-- Add mappings to disable arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", "<NOP>", { noremap = true })

-- Paste below the current line while keeping the cursor at the correct position
vim.keymap.set("n", "p", function()
	local pos = vim.api.nvim_win_get_cursor(0)
	local row, col = pos[1], pos[2]
	vim.cmd("put")
	vim.api.nvim_win_set_cursor(0, { row + 1, col })
end)
