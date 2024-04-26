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

-------------------STATUSLINE----------------------------
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

function my_statusline()
    local branch = vim.fn.FugitiveHead()

    if branch and #branch > 0 then
        branch = " " .. branch
    end

    return "%<"
        .. branch
        -- " | "
        .. '  '
        .. "%f"
        .. " "
        .. "%m"
        .. "%="
        .. "%y"
        .. " "
        .. "%l:%c"
        .. " "
        .. progress()
        .. " "
end

vim.opt.statusline = "%{%v:lua.my_statusline()%}"
-------------------END STATUSLINE----------------------------

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
