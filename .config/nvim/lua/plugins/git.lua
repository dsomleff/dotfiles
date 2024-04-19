return {
    {
        "tpope/vim-fugitive",

        config = function()
            vim.keymap.set({ "n", "v" }, "<leader>gb", ":G blame<CR>", {})
            vim.keymap.set({ "n", "v" }, "<leader>gc", ":G commit<CR>", {})
            vim.keymap.set({ "n", "v" }, "<leader>gl", ":G log<CR>", {})
        end
    },
    {
        "lewis6991/gitsigns.nvim",

        config = function()
            local gs = package.loaded.gitsigns

            require("gitsigns").setup({
                --              signs = {
                --  add = { text = '+' },
                --  change = { text = '~' },
                --  delete = { text = '_' },
                --  topdelete = { text = '‾' },
                --  changedelete = { text = '~' },
                --},
                signs = {
                    add = { text = "▎" },
                    change = { text = "▎" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "▎" },
                    untracked = { text = "▎" },
                },

                vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {}),
                vim.keymap.set("n", "<leader>gd", ":Gvdiff<CR>", {}),

                vim.keymap.set("n", "]c", function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true }),

                vim.keymap.set("n", "[c", function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true }),

                vim.keymap.set({ "n", "v" }, "<leader>tb", ":Gitsigns blame_line <CR>", {})
            })
        end,
    }
}
