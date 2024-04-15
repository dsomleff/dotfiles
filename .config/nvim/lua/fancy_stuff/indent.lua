return {
    "lukas-reineke/indent-blankline.nvim",

    config = function()
        require("ibl").setup({
            scope = {
                char = "|",
                show_start = false,
                enabled = false,
            },
            indent = {
                char = "|",
                --tab_char = { "a", "b", "c" },
                --highlight = { "Function", "Label" },
                smart_indent_cap = false,

            },
            whitespace = {
                highlight = { "Function", "Label" },
                remove_blankline_trail = true,
            },
        })
    end,
}
