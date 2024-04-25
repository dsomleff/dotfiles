vim.opt.nu = true
vim.opt.relativenumber = true

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

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Enable cursor blinking
vim.opt.guicursor = vim.opt.guicursor + "a:blinkon20"

-- highlight the line number of the cursor
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- tree view in netrw
vim.cmd("let g:netrw_liststyle = 0")

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- backspace
vim.opt.backspace = "indent,eol,start"

-- disable auto-comments on new line
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Add mappings to disable arrow keys
vim.api.nvim_set_keymap('n', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true })

-- show git branch name with Fugitive
--vim.opt.statusline = "%<%f\\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\\ %P"
