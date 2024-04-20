return {
    "tpope/vim-fugitive",

    config = function()
        vim.keymap.set({ "n", "v" }, "<leader>gb", ":G blame<CR>", {})
        vim.keymap.set({ "n", "v" }, "<leader>gc", ":G | only<CR>", {})
        vim.keymap.set({ "n", "v" }, "<leader>gr", ":G log --oneline --decorate --graph --all | only<CR>", {})
    end
}

