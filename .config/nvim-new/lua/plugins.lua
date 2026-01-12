vim.pack.add({
    { src = "https://github.com/slugbyte/lackluster.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
        data = {
          on_update = function()
            vim.cmd('TSUpdate')
          end,
        },
    },
})

-------------------------------------------------
-- Theme
-------------------------------------------------
local lackluster = require("lackluster")
local color = lackluster.color

lackluster.setup({
  tweak_ui = {
    enable_end_of_buffer = true,
  },
  tweak_highlight = {
        -- Git diff
    -- StatusLineGitDiffAdded = { fg = color.green },
    -- StatusLineGitDiffChanged = { fg = color.lack },
    -- StatusLineGitDiffRemoved = { fg = color.orange },
    -- LSP diagnostics
    -- StatusLineLspError = { fg = color.red, bold = true },
    -- StatusLineLspWarn = { fg = color.orange, bold = true },
    -- StatusLineLspHints = { fg = color.yellow, bold = true },
    -- StatusLineLspInfo = { fg = color.blue, bold = true },

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
-- vim.cmd(":hi statusline guibg=NONE")

-- Custom highlights
-- vim.api.nvim_set_hl(0, "Normal",        { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat",   { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder",   { fg = color.gray9, bg = "#101010" })

-- Override Gitsigns highlights
-- vim.api.nvim_set_hl(0, "GitSignsAdd",    { fg = color.green,  bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = color.lack,   bg = "none" })
-- vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = color.orange, bg = "none" })

-------------------------------------------------
-- Oil
-------------------------------------------------
require "oil".setup({
    -- default_file_explorer = false,
    delete_to_trash = true,
    view_options = {
        show_hidden = true,
    },
})
-------------------------------------------------
-- Treesitter
-------------------------------------------------
local parsers = {
  "bash",
  "dockerfile",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "go",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "query",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}
require("nvim-treesitter.config").setup({
    ensure_installed = parsers,
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
})

local function packchanged(event)
  local after = event.data.spec.data and event.data.spec.data.after
  if not after then return end

  local pkg_name = event.data.spec.name

  local retries = 0
  local function wait()
    if retries > 20 then return end  -- avoid infinite loop
    retries = retries + 1

    package.loaded[pkg_name] = nil
    local ok, _ = pcall(require, pkg_name)

    if ok then
      if type(after) == "function" then
        after()
      elseif type(after) == "string" then
        pcall(vim.cmd, after)
      end
    else
      vim.defer_fn(wait, 50)
    end
  end

  wait()
end

vim.api.nvim_create_autocmd("packchanged", { callback = packchanged })
