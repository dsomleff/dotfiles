-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Tab and Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- File settings
vim.opt.autoread = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Cursor and display settings
vim.opt.termguicolors = true
vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.cursorlineopt = "both" -- highlight the line number of the cursor
vim.opt.cursorline = true
vim.opt.guicursor = vim.opt.guicursor + "a:blinkon20" -- Enable cursor blinking

-- Timeouts
vim.opt.timeoutlen = 300 -- How long Vim waits for keymap response (in ms)

-- Allow `@` and `-` to be considered part of filenames
vim.opt.isfname:append("@-@")

-- Set the update time for events to 50ms for quicker responsiveness
vim.opt.updatetime = 50

vim.g.have_nerd_font = true

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw
vim.g.netrw_banner = 0

-- Spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- backspace
vim.opt.backspace = "indent,eol,start"

-- always display diff window vertically
vim.opt.diffopt:append("vertical")

-- Providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
