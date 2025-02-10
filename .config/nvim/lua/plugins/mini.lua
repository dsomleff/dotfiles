return {
    {
        "echasnovski/mini.ai",
        version = false,

        config = function()
            require("mini.ai").setup({
                -- around/next quotes = "aq"
                -- around/next brackets = "ab"
                -- around/next arguments = "aa"
                --around_last = "al",
                --inside_last = "il",
            })
        end,
    },
    {
        "echasnovski/mini.surround",
        version = false,

        config = function()
            require("mini.surround").setup({
                -- `saiw)` - add (`sa`) for inner word (`iw`) parenthesis (`)`).
                -- delete = 'sd', -- Delete surrounding
                -- sr'" -- Replace surrounding
                -- srt -- Replace surrounding tags
            })
        end,
    },
    {
        "echasnovski/mini.pairs",
        version = false,

        config = function()
            require("mini.pairs").setup()
        end,
    },
}
