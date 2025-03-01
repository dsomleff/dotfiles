return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "dracula",
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                always_divide_middle = true,
                globalstatus = false,
                -- refresh = {
                -- 	statusline = 1000,
                -- 	tabline = 1000,
                -- 	winbar = 1000,
                -- },
            },
            sections = {
                lualine_a = {
                    { "branch", icon = "" },
                },
                lualine_b = {
                    {
                        "filename",
                        file_status = true,
                        path = 1,
                    },
                },
                lualine_c = {
                    "diff",
                    { "diagnostics", sources = { "nvim_diagnostic" } },
                },
                lualine_x = { "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}
