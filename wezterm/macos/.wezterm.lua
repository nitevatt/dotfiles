local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "OneDark (base16)"
config.initial_cols = 160
config.initial_rows = 40
config.font_size = 16.0
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config

