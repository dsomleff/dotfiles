return {
    {
        "tpope/vim-fugitive",

        config = function()
            vim.keymap.set({ "n", "v" }, "<leader>gb", ":G blame<CR>", {})
            vim.keymap.set({ "n", "v" }, "<leader>gc", ":G commit<CR>", {})
        end
    },
    {
        "lewis6991/gitsigns.nvim",

        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "▎" },
                    change = { text = "▎" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "▎" },
                    untracked = { text = "▎" },
                },

                vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
            })
        end,
    }
}
