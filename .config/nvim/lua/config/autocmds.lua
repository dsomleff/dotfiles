--remove white space at the end of a line
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = [[%s/\s\+$//e]]
})

-- format on save
vim.api.nvim_create_augroup("AutoFormatting", {})

autocmd("BufWritePre", {
    group = "AutoFormatting",
    callback = function()
        vim.lsp.buf.format()
    end,
})

-- open Netrw after no open buffers left
vim.api.nvim_create_augroup("AutoCommands", {})

autocmd("BufEnter", {
    group = "AutoCommands",
    pattern = "*",
    command = "if !argc() | Explore | endif",
})

-- grab the name of the current git branch
local function branch_name()
    local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
    if branch ~= "" then
        return branch .. " | "
    else
        return ""
    end
end

local function file_name()
    local root_path = vim.fn.getcwd()
    local root_dir = root_path:match("[^/]+$")
    local home_path = vim.fn.expand("%:~")
    local overlap, _ = home_path:find(root_dir)
    if home_path == "" then
        return root_path:gsub("/Users/[^/]+", "~")
    elseif overlap then
        return home_path:sub(overlap)
    else
        return home_path
    end
end

local function progress()
    if vim.fn.line(".") == 1 then
        return "top"
    elseif vim.fn.line(".") == vim.fn.line("$") then
        return "bot"
    else
        local p = vim.fn.line(".") / vim.fn.line("$") * 100
        p = p % 1 >= .5 and math.ceil(p) or math.floor(p)
        return string.format("%02d", p) .. "%%"
    end
end

autocmd({ "FileType", "BufEnter", "FocusGained", "CursorHold", "CursorHoldI", "FileChangedShellPost" }, {
    callback = function()
        vim.b.branch_name = branch_name()
        vim.b.file_name = file_name()
    end
})

function Status_Line()
    return " "
        .. "%<"
        .. vim.b.branch_name
        .. vim.b.file_name
        .. " "
        .. "%h"
        .. "%m"
        .. "%="
        .. "%y"
        .. " "
        .. progress()
        .. " "
end

vim.opt.statusline = "%{%v:lua.Status_Line()%}"

-- highlight on yank
autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Set bufhidden=delete for fugitive buffers after reading
autocmd({ "BufReadPost" }, {
    pattern = "fugitive://*",
    command = "set bufhidden=delete"
})
