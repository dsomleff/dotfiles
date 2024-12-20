local function progress()
	if vim.fn.line(".") == 1 then
		return "top"
	elseif vim.fn.line(".") == vim.fn.line("$") then
		return "bot"
	else
		local p = math.floor(vim.fn.line(".") / vim.fn.line("$") * 100)

		return string.format("%02d", p) .. "%%"
	end
end

function my_statusline()
	local branch = vim.fn.FugitiveHead()
	local readonly = vim.bo.readonly and "[RO]" or ""

	if branch and #branch > 0 then
		branch = " " .. branch .. " | "
	end

	return "%<"
		.. branch
		.. "%f"
		.. " "
		.. readonly
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
