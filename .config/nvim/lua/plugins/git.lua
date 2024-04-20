return {
    {
        "tpope/vim-fugitive",
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim",
        },
        config = function()
            local neogit = require('neogit')

            require("neogit").setup({

                vim.keymap.set("n", "<leader>gs", neogit.open,
                    { silent = true, noremap = true }
                ),

                vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>",
                    { silent = true, noremap = true }
                ),

                vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>",
                    { silent = true, noremap = true }
                ),

                vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>",
                    { silent = true, noremap = true }
                ),

                vim.keymap.set("n", "<leader>gB", ":G blame<CR>",
                    { silent = true, noremap = true }
                ),
            })
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

                vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {}),
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
                --
                --            vim.keymap.set("n", "<leader>tc", builtin.git_commits, {})
                --            vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
                --            vim.keymap.set("n", "<leader>bl", builtin.git_branches, {})
                -- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            })
        end,
    }
}
