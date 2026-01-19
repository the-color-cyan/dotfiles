local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.default_prog = {}

config.font = wezterm.font("Dank Mono")
config.font_size = 14

config.default_cursor_style = "BlinkingBlock"

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

-- local theme = wezterm.color.get_builtin_schemes()["Tokyo Night"]

-- theme.tab_bar.active_tab.underline = "Single"
-- theme.tab_bar.active_tab.italic = true

-- config.color_schemes = {
-- 	["cyan"] = theme,
-- }

config.color_scheme = "Rosé Pine (Gogh)"

return config
