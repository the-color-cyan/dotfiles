---custom logo type beat
return {
	"snacks.nvim",
	opts = {
		dashboard = {
			preset = {
				pick = function(cmd, opts)
					return LazyVim.pick(cmd, opts)()
				end,
				header = [[
 _____  ___    _______    ______  ___      ___  __     ___      ___ 
(\"   \|"  \  /"     "|  /    " \|"  \    /"  ||" \   |"  \    /"  |
|.\\   \    |(: ______) // ____  \\   \  //  / ||  |   \   \  //   |
|: \.   \\  | \/    |  /  /    ) :)\\  \/. ./  |:  |   /\\  \/.    |
|.  \    \. | // ___)_(: (____/ //  \.    //   |.  |  |: \.        |
|    \    \ |(:      "|\        /    \\   /    /\  |\ |.  \    /:  |
 \___|\____\) \_______) \"_____/      \__/    (__\_|_)|___|\__/|___|
                                                                    
]],
         -- stylua: ignore
         ---@type snacks.dashboard.Item[]
         keys = {
           { icon = " ", key = "f", desc = "find file", action = ":lua Snacks.dashboard.pick('files')" },
           { icon = " ", key = "n", desc = "new file", action = ":ene | startinsert" },
           { icon = " ", key = "g", desc = "find text", action = ":lua Snacks.dashboard.pick('live_grep')" },
           { icon = " ", key = "r", desc = "recent files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
           { icon = " ", key = "c", desc = "config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
           { icon = " ", key = "s", desc = "restore session", section = "session" },
           { icon = " ", key = "x", desc = "lazy extras", action = ":LazyExtras" },
           { icon = "󰒲 ", key = "l", desc = "lazy", action = ":Lazy" },
           { icon = " ", key = "q", desc = "quit", action = ":qa" },
         },
			},
			sections = {
				{ section = "header" },
				{
					pane = 2,
					section = "terminal",
					cmd = (function()
						if vim.fn.has("unix") == 1 then
							return "colorscript -e square"
						elseif vim.fn.has("win32") == 1 then
							return 'powershell -NoProfile -Command "Show-ColorScript -Name square"'
						end
					end)(),
					height = 5,
					padding = 5,
				},
				{ section = "keys", gap = 0, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},

		zen = {
			show = {
				statusline = false,
				tabline = false,
			},
			win = {
				width = 120,
			},
		},
		styles = {
			zen = {
				backdrop = {
					transparent = true,
					blend = 20,
				},
			},
		},
	},
}

--  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
--  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
-- ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
-- ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██
-- ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
-- ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
-- ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
--    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
--          ░    ░  ░    ░ ░        ░   ░         ░
--                                 ░
