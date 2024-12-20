vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.autoread = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- How long vim wait for keymap response (1sec)
vim.opt.timeoutlen = 300

vim.g.have_nerd_font = true
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw
vim.g.netrw_banner = 0

vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Enable cursor blinking
vim.opt.guicursor = vim.opt.guicursor + "a:blinkon20"

-- highlight the line number of the cursor
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- backspace
vim.opt.backspace = "indent,eol,start"

-- always display diff window vertically
vim.opt.diffopt:append("vertical")

-- Providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
