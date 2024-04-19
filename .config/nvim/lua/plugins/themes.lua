return {
    {
        "rose-pine/neovim",
        lazy = false,
        name = "rose-pine",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("rose-pine")

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    },
    {
        "eandrju/cellular-automaton.nvim",

        vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>"),
        vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>"),
        vim.keymap.set("n", "<leader>mtx", "<cmd>CellularAutomaton scramble<CR>")
    },
    {
        "folke/zen-mode.nvim",

        vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>"),
    }
}
