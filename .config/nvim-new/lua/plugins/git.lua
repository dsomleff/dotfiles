local keymap = vim.keymap.set
-- =========================
-- Fugitive keymaps
-- =========================
keymap("n", "<leader>gs", "<cmd>G | only<CR>", { desc = "Git status" })
keymap("n", "<leader>gp", "<cmd>G pull<CR>", { desc = "Git pull" })
keymap("n", "<leader>gP", "<cmd>G push<CR>", { desc = "Git push" })
keymap("n", "<leader>gf", "<cmd>G fetch<CR>", { desc = "Git fetch" })
keymap("n", "<leader>gD", ":G branch -D ", { desc = "Delete branch" })
keymap("n", "<leader>gH", "<cmd>G log --oneline --decorate --graph --parents<CR>", { desc = "Git history" })
keymap("n", "<leader>gd", "<cmd>Gvdiff<CR>", { desc = "Git diff" })
keymap("n", "<leader>mc", "<cmd>Gvdiffsplit!<CR>", { desc = "Merge conflict" })
keymap("n", "gh", "<cmd>diffget //2<CR>", { desc = "Get left hunk" })
keymap("n", "gl", "<cmd>diffget //3<CR>", { desc = "Get right hunk" })

keymap("n", "<leader>sl", function()
	local result = vim.fn.system("git stash list")

	if result == "" then
		print("No stashes found.")
	else
		vim.cmd("Gclog -g stash")
	end
end, { desc = "Stash list" })

-- =========================
-- Gitsigns keys
-- =========================
keymap("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
keymap({ "n", "v" }, "<leader>gbb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })
keymap({ "n", "v" }, "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
keymap("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
keymap("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev hunk" })
keymap("n", "<leader>gb", "<cmd>Gitsigns blame<CR>", { desc = "Git blame" })
keymap("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff this" })
