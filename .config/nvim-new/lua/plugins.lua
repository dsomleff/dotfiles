vim.pack.add({
    { src = "https://github.com/slugbyte/lackluster.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
})

-------------------------------------------------
-- 2️⃣Configure them
-------------------------------------------------
-- vim.cmd(":hi statusline guibg=NONE")
local lackluster = require("lackluster")
local color = lackluster.color

lackluster.setup({
  tweak_ui = {
    enable_end_of_buffer = true,
  },
  tweak_highlight = {
        -- Git diff
    StatusLineGitDiffAdded = { fg = color.green },
    StatusLineGitDiffChanged = { fg = color.lack },
    StatusLineGitDiffRemoved = { fg = color.orange },
    -- LSP diagnostics
    StatusLineLspError = { fg = color.red, bold = true },
    StatusLineLspWarn = { fg = color.orange, bold = true },
    StatusLineLspHints = { fg = color.yellow, bold = true },
    StatusLineLspInfo = { fg = color.blue, bold = true },

    ["@keyword"] = {
      overwrite = false,
      italic = true,
    },
    ["@function"] = {
      overwrite = true,
      link = "@keyword",
    },
    ["@comment"] = {
      overwrite = false,
      italic = true,
    },
    ["@property"] = {
      overwrite = false,
      italic = true,
    },
  },
})

vim.cmd("colorscheme lackluster")

-- Custom highlights
vim.api.nvim_set_hl(0, "Normal",        { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat",   { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder",   { fg = color.gray9, bg = "#101010" })

-- Override Gitsigns highlights
-- vim.api.nvim_set_hl(0, "GitSignsAdd",    { fg = color.green,  bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = color.lack,   bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = color.orange, bg = "none" })

require "oil".setup({
    -- default_file_explorer = false,
    delete_to_trash = true,
    view_options = {
        show_hidden = true,
    },
})
