return {
    "nvim-treesitter/nvim-treesitter",

    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",

    config = function()
        local config = require("nvim-treesitter.configs")

        config.setup({
            autotag = {
                enable = true,
            },

            ensure_installed = {
                "vimdoc",
                "javascript",
                "typescript",
                "lua",
                "go",
                "jsdoc",
                "json",
                "yaml",
                "html",
                "css",
                "markdown",
                "bash",
            },

            sync_install = false,

            auto_install = true,

            indent = {
                enable = true
            },

            highlight = {
                enable = true,


                additional_vim_regex_highlighting = { "markdown" },
            },
        })
    end,
}
