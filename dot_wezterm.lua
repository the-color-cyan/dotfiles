local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.default_prog = {}

config.font = wezterm.font("Dank Mono")
config.font_size = 14

config.default_cursor_style = "BlinkingBlock"

config.use_fancy_tab_bar = false

local theme = wezterm.color.get_builtin_schemes()["Tokyo Night"]

theme.tab_bar.active_tab.underline = "Single"
theme.tab_bar.active_tab.italic = true

config.color_schemes = {
	["cyan"] = theme,
}

config.color_scheme = "cyan"

return config
