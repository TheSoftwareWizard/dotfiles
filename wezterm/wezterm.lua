local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = true
config.front_end = "WebGpu"
config.colors = {
    foreground = "#ebdbb2",
    background = "#282828",
    cursor_bg = "#ebdbb2",
    cursor_fg = "#282828",
    cursor_border = "#ebdbb2",
    selection_fg = "#282828",
    selection_bg = "#fabd2f",
    scrollbar_thumb = "#504945",
    split = "#504945",

    ansi = {
        "#282828",
        "#cc241d",
        "#98971a",
        "#d79921",
        "#458588",
        "#b16286",
        "#689d6a",
        "#a89984",
    },
    brights = {
        "#928374",
        "#fb4934",
        "#b8bb26",
        "#fabd2f",
        "#83a598",
        "#d3869b",
        "#8ec07c",
        "#ebdbb2",
    },

}
config.font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "JetBrainsMono Nerd Font",
    "Noto Color Emoji",
})
config.font_size = 9.0
config.line_height = 1.1
config.window_background_opacity = 0.8
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}
config.window_decorations = "NONE"
config.window_close_confirmation = "NeverPrompt"
config.initial_rows = 30
config.initial_cols = 120

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 32
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = true

config.colors.tab_bar = {
    background = "#1d2021",
    active_tab = { bg_color = "#d79921", fg_color = "#1d2021", intensity = "Bold" },
    inactive_tab = { bg_color = "#3c3836", fg_color = "#a89984" },
    inactive_tab_hover = { bg_color = "#504945", fg_color = "#ebdbb2", italic = false },
    new_tab = { bg_color = "#1d2021", fg_color = "#928374" },
    new_tab_hover = { bg_color = "#98971a", fg_color = "#1d2021" },
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local title = tab.active_pane.title
    if #title > max_width - 4 then
        title = string.sub(title, 1, max_width - 7) .. "..."
    end
    local icon = " "
    local process = tab.active_pane.foreground_process_name or ""
    
    if process:find("nvim") then
        icon = " "
    elseif process:find("zsh") or process:find("bash") then
        icon = " "
    elseif process:find("git") then
        icon = " "
    elseif process:find("node") then
        icon = " "
    elseif process:find("python") then
        icon = " "
    elseif process:find("ssh") then
        icon = "󰣀 "
    elseif process:find("docker") then
        icon = " "
    elseif process:find("htop") or process:find("btop") then
        icon = " "
    end
    
    if tab.is_active then
        return {
            { Background = { Color = "#d79921" } },
            { Foreground = { Color = "#1d2021" } },
            { Text = " " .. icon .. title .. " " },
        }
    else
        return {
            { Background = { Color = "#3c3836" } },
            { Foreground = { Color = "#a89984" } },
            { Text = " " .. icon .. title .. " " },
        }
    end
end)

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 300
config.animation_fps = 1
config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.check_for_updates = false
config.audible_bell = "Disabled"
config.warn_about_missing_glyphs = false
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.keys = {
    { key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "e", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
    { key = "+", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
}

return config
