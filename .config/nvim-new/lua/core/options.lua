local opt = vim.opt

-- Enable line numbers
opt.number = true
opt.relativenumber = true

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Tab and Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- File settings
opt.autoread = true
opt.wrap = true
opt.swapfile = false
opt.backup = false

-- Search settings
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Cursor and display settings
opt.termguicolors = true
opt.scrolloff = 999
opt.signcolumn = "yes:1"
opt.colorcolumn = "120"
opt.cursorlineopt = "both" -- highlight the line number of the cursor
opt.cursorline = true
opt.guicursor = opt.guicursor + "a:blinkon20" -- Enable cursor blinking

-- Undo tree folder
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Spell check
opt.spelllang = "en_us"
opt.spell = true

-- always display diff window vertically
opt.diffopt:append("vertical")

-- window border
opt.winborder = "rounded"

-- Accept camelCase
opt.spelloptions:append("camel")

-- substitute preview
opt.inccommand = "split"

-- Providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
