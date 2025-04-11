local wezterm = require("wezterm")

local function font_with_fallback(name, params)
names = { name, "Apple Color Emoji", "azuki_font" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "Maple Mono SC NF"

return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",
	
	-- default_prog = {"/bin/zsh", "-l", "-c", "tmux attach || tmux new-session"},

	color_scheme= 'Everforest',

	-- Font config
	font = font_with_fallback(font_name),
	font_rules = {
		{
			italic = true,
			font = font_with_fallback(font_name, { italic = true }),
		},
		{
			italic = false,
			font = font_with_fallback(font_name, { bold = true }),
		},
		{
			intensity = "Bold",
			font = font_with_fallback(font_name, { bold = true }),
		},
	},
	warn_about_missing_glyphs = false,
	font_size = 10,
	line_height = 1.0,
	dpi = 96.0,

	-- Cursor style
	default_cursor_style = "BlinkingUnderline",

	-- X11
	enable_wayland = false,

	-- Keybinds
	disable_default_key_bindings = false,
	

	-- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,
	-- Padding
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = true,

	-- General
	automatically_reload_config = true,
	inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
	window_background_opacity = 0.7,
	window_close_confirmation = "NeverPrompt",
  window_frame = { active_titlebar_bg = "#45475a", font = font_with_fallback(font_name, { bold = true }) },

--   return {
-- 	colors = {
-- 	  foreground = "#d0f0c0",          -- Texto verde claro
-- 	  background = "#1a2f1a",          -- Fondo verde oscuro
-- 	  cursor_bg = "#73d073",           -- Cursor verde brillante
-- 	  cursor_border = "#73d073",
-- 	  ansi = {
-- 		"#1a2f1a", "#5f9e5f", "#8ac48a", "#a3d9a3",
-- 		"#4a784a", "#6b9e6b", "#87b787", "#c0e0c0"
-- 	  },
-- 	  brights = {
-- 		"#2d4d2d", "#7fbf7f", "#9fd99f", "#b3e6b3",
-- 		"#5f8f5f", "#8fbf8f", "#a3d9a3", "#d0f0d0"
-- 	  },
-- 	  indexed = { [136] = "#af8700" }, -- Ajustes adicionales
-- 	},
--   }
}
