return {
    {
        "nvim-telescope/telescope.nvim",

        tag = "0.1.5",

        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        theme = "dropdown",
                    },
                    live_grep = {
                        theme = "dropdown",
                    },
                    help_tags = {
                        theme = "ivy",
                    },
                    git_files = {
                        theme = "dropdown",
                    },
                    grep_string = {
                        theme = "dropdown",
                    },
                    git_status = {
                        theme = "ivy"
                    },
                },
            })


            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

            vim.keymap.set('n', '<leader>fw', function()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })
            end)

            vim.keymap.set('n', '<leader>fl', function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end)


            vim.keymap.set("n", "<leader>fr", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})


            --vim.keymap.set("n", "<leader>bd", actions.delete_buffer, {})


            --            vim.keymap.set("n", "<leader>tc", builtin.git_commits, {})
            --            vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
            --            vim.keymap.set("n", "<leader>bl", builtin.git_branches, {})
            -- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        end,
    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
