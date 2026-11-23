---@diagnostic disable: undefined-global
local HOME = os.getenv("HOME")
local SHELL = "com.superlogical.terminal.shell"
local NU = "/opt/homebrew/bin/nu"

local LAB = {
	{ id = "studio-ai-lab", cmd = "./scripts/run.sh", shell = "/bin/zsh" },
	{ id = "studio-ai-lab-frontend", cmd = "npm run dev" },
	{ id = "studio-companion-frontend", cmd = "npm run dev" },
}

local function window(dir, shell, input)
	return {
		layout = rex.layout.block({
			flavor = SHELL,
			options = { cwd = dir, shell = shell, initial_input = input },
		}),
	}
end

-- Kills any existing lab session and recreates it, so re-runs never leave duplicates.
rex.action({
	name = "open_lab",
	title = "Open Lab Sessions",
	run = function()
		local existing = {}
		for _, s in ipairs((rex.call("session.list") or {}).sessions or {}) do
			existing[s.label] = s.session_id
		end

		local last
		for _, p in ipairs(LAB) do
			if existing[p.id] then
				rex.call("session.destroy", { session_id = existing[p.id] })
			end
			local dir = HOME .. "/Code/" .. p.id
			local s, err = rex.call("session.create", {
				label = p.id,
				initial_windows = {
					window(dir, NU, "nvim .\r"),
					window(dir, p.shell or NU, p.cmd .. "\r"),
				},
			})
			if s == nil then
				error("session.create: " .. tostring(err), 0)
			end
			last = s.session_id
		end
		rex.client.queue("session.select", { session_id = last })
	end,
})
