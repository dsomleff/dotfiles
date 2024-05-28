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
vim.keymap.set("n", "<leader>p", [["_dP]])

-- copy into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>Y", [[gg"+yG]])

-- prevent big Q pressing ;)
vim.keymap.set("n", "Q", "<nop>")

-- tmux sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix navigation
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "[Q", "<cmd>cfirst<CR>zz")
vim.keymap.set("n", "]Q", "<cmd>clast<CR>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace word globaly
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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
-- vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Navigating buffers
--vim.keymap.set("n", "<S-l>", ":bnext<CR>")
--vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "[b", ":bprevious<CR>")
vim.keymap.set("n", "]b", ":bnext<CR>")
vim.keymap.set("n", "[B", ":bfirst<CR>")
vim.keymap.set("n", "]B", ":blast<CR>")

-- Tab's
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Markdown preview
vim.opt.conceallevel = 2

-- Display LSP hints
-- vim.keymaps.set("n", "<leader>h", vim.lsp.inlay_hint.enable())
vim.keymap.set("n", "<leader>h", function()
	vim.lsp.inlay_hint.enable()
end)

-- Exit build in terminal
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Open terminal
vim.keymap.set("n", "<leader>bt", "<cmd>bo te<CR>")

-- Close single open buffer
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>")

-- Close all open buffers
vim.keymap.set("n", "<leader>Q", "<cmd>bufdo bd<CR>")

-- Diagnostic keymaps already build in
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
