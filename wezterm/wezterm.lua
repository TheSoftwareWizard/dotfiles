local wezterm = require("wezterm")

local function font_with_fallback(name, params)
names = { name, "Apple Color Emoji", "azuki_font" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "JetBrains Mono"

return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",
	
	-- default_prog = {"/bin/zsh", "-l", "-c", "tmux attach || tmux new-session"},

	color_scheme = 'Dark+',

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
  window_frame = { active_titlebar_bg = "#0096c7", font = font_with_fallback(font_name, { bold = true }) },

	-- Esquema de colores personalizado basado en nueva paleta de azules
	colors = {
		foreground = "#caf0f8",           -- light-cyan (texto principal)
		background = "#060817",           -- federal-blue (fondo)
		cursor_bg = "#0077b6",            -- honolulu-blue (cursor)
		cursor_border = "#0077b6",        -- honolulu-blue (border del cursor)
		cursor_fg = "#caf0f8",            -- light-cyan (texto del cursor)
		
		selection_bg = "#0096c7",         -- blue-green (fondo de selección)
		selection_fg = "#caf0f8",         -- light-cyan (texto de selección)
		
		ansi = {
			"#03045e",    -- Negro (federal-blue)
			"#90e0ef",    -- Rojo (non-photo-blue para contraste)
			"#48cae4",    -- Verde (vivid-sky-blue)
			"#ade8f4",    -- Amarillo (non-photo-blue-2)
			"#0077b6",    -- Azul (honolulu-blue)
			"#00b4d8",    -- Magenta (pacific-cyan)
			"#0096c7",    -- Cian (blue-green)
			"#caf0f8",    -- Blanco (light-cyan)
		},
		brights = {
			"#023e8a",    -- Negro brillante (marian-blue)
			"#90e0ef",    -- Rojo brillante (non-photo-blue)
			"#48cae4",    -- Verde brillante (vivid-sky-blue)
			"#ade8f4",    -- Amarillo brillante (non-photo-blue-2)
			"#0096c7",    -- Azul brillante (blue-green)
			"#00b4d8",    -- Magenta brillante (pacific-cyan)
			"#48cae4",    -- Cian brillante (vivid-sky-blue)
			"#caf0f8",    -- Blanco brillante (light-cyan)
		},
		
		-- Colores para tabs
		tab_bar = {
			background = "#03045e",  -- federal-blue
			active_tab = {
				bg_color = "#0077b6",  -- honolulu-blue
				fg_color = "#caf0f8",  -- light-cyan
			},
			inactive_tab = {
				bg_color = "#023e8a",  -- marian-blue
				fg_color = "#90e0ef",  -- non-photo-blue
			},
			inactive_tab_hover = {
				bg_color = "#0096c7",  -- blue-green
				fg_color = "#caf0f8",  -- light-cyan
			},
		},
	},
}
