-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.color_scheme = "Tokyo Night"

config.font = wezterm.font("Hack Nerd Font", { weight = "Regular" })
config.font_size = 15.0

config.enable_kitty_keyboard = true

config.visual_bell = {
	fade_in_duration_ms = 75,
	fade_out_duration_ms = 75,
	target = "CursorColor",
}

-- and finally, return the configuration to wezterm
return config
