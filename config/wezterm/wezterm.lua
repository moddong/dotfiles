local wezterm = require("wezterm")
local config = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "powershell" }
end
config.font = wezterm.font_with_fallback({
	"SF Mono",
	-- 'Operator Mono',
	"LXGW WenKai Mono",
})
config.font_size = 14
config.enable_tab_bar = false
config.color_scheme = 'tokyonight_day'
config.colors = {
	-- background = "#161a24",
	-- foreground = "#ada37a",
	background = "#fafafa",
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
