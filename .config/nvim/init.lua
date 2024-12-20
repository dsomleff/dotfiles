require("config.options")
require("config.keymap")
require("config.lazy")
require("config.autocmds")

local modules = {
	"config.options",
	"config.keymap",
	"config.lazy",
	"config.autocmds",
}

for _, module in ipairs(modules) do
	local ok, err = pcall(require, module)
	if not ok then
		vim.notify("Failed to load " .. module .. "\n" .. err, vim.log.levels.ERROR)
	end
end
