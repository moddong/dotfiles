local wezterm = require("wezterm")
local config = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "nu" }
end
config.font = wezterm.font_with_fallback({
	-- "SF Mono",
	"Operator Mono",
	"LXGW WenKai Mono",
})
config.font_size = 13.5
config.enable_tab_bar = false
config.colors = {
	background = "#fafafa",
	foreground = "#3760bf",
	cursor_bg = "#3760bf",
	cursor_border = "#3760bf",
	cursor_fg = "#e1e2e7",
	selection_bg = "#b6bfe2",
	selection_fg = "#3760bf",
	split = "#2e7de9",
	compose_cursor = "#b15c00",
	ansi = { "#e9e9ed", "#f52a65", "#587539", "#8c6c3e", "#2e7de9", "#9854f1", "#007197", "#6172b0" },
	brights = { "#a1a6c5", "#f52a65", "#587539", "#8c6c3e", "#2e7de9", "#9854f1", "#007197", "#3760bf" },
}

config.window_padding = {
	top = 0,
	right = 0,
	bottom = 0,
	left = 0,
}

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

return config
