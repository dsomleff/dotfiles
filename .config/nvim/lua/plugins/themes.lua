return {
    {
        "rose-pine/neovim",
        lazy = false,
        name = "rose-pine",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("rose-pine")
        end,
    },
    {
        "eandrju/cellular-automaton.nvim",

        vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>"),
        vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>"),
        vim.keymap.set("n", "<leader>mtx", "<cmd>CellularAutomaton scramble<CR>")
    },
    -- Lua
    {
        "folke/zen-mode.nvim",


        vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>"),
    }
}
