# Configuration Files

This document lists the configuration files modified or created during system setup.

---

## Hyprland (Window Manager)

### `/home/drak/.config/hypr/hyprland.conf`
- Main Hyprland configuration
- Gruvbox theme, animations, keybindings
- Autostart: waybar, mako, wallpaper
- Monitors, screenshots (hyprshot: Print = region, Super+Print = fullscreen)
- WezTerm Wayland env

---

## Waybar (Status Bar)

### `/home/drak/.config/waybar/config`
- Waybar config (JSON)
- Modules: workspaces, window, media player, cava, CPU, GPU, RAM, volume, network, clock, tray

### `/home/drak/.config/waybar/style.css`
- Gruvbox theme, JetBrains Mono Nerd Font, rounded borders

### `/home/drak/.config/waybar/scripts/mediaplayer.sh`
- Media info via playerctl (MPRIS) and PipeWire sink-inputs (Discord, browsers, games)
- Output: icon + artist - title (truncated)

### `/home/drak/.config/waybar/scripts/cava.sh`
- Pipes cava raw output to Unicode bars for Waybar

---

## WezTerm (Terminal)

### `/home/drak/.config/wezterm/wezterm.lua`
- Wayland, WebGpu, Gruvbox Dark, JetBrains Mono Nerd Font, font size 9, opacity 0.8
- Tab bar at bottom, custom tab colors and process-based icons
- Keybindings: Ctrl+Shift+D/E split, Ctrl+Shift+Arrow pane focus, Ctrl+Plus/Minus/0 font size
- Scrollback 10000, SteadyBlock cursor

---

## Cava (Audio Visualizer)

### `/home/drak/.config/cava/config`
- 60 FPS, 12 bars, Gruvbox gradient, raw ASCII for Waybar, PulseAudio, smoothing

### `/home/drak/.config/cava/shaders/`
- `bar_spectrum.frag`, `northern_lights.frag`, `pass_through.vert`

---

## Mako (Notifications)

### `/home/drak/.config/mako/config`
- Gruvbox: black bg, beige text, yellow border, JetBrains Mono 9
- Max 300x100, radius 4, padding 10, timeout 5s (10s high urgency), max history 1000

---

## Fastfetch (System Info)

### `/home/drak/.config/fastfetch/config.jsonc`
- Gruvbox colors, kitty backend, custom image (maomao2.jpg), Nerd Font keys
- Modules: OS, host, CPU, GPU, RAM, disk, packages, shell, terminal, WM, uptime, GitHub block

### `/home/drak/.config/fastfetch/images/`
- `maomao.jpg`, `maomao2.jpg`

---

## Neovim / LazyVim

### `/home/drak/.config/nvim/init.lua`
- Loads LazyVim via `config.lazy`

### `/home/drak/.config/nvim/lua/config/lazy.lua`
- LazyVim base, colorschemes: gruvbox, tokyonight, habamax, custom plugins from `plugins/`

### `/home/drak/.config/nvim/lua/config/options.lua`
- Word wrap, linebreak, breakindent, showbreak; transparent background

### `/home/drak/.config/nvim/lua/plugins/colorscheme.lua`
- gruvbox.nvim, transparent mode, visual selection bg overrides

### `/home/drak/.config/nvim/lua/plugins/discord.lua`
- presence.nvim: Discord Rich Presence (file, workspace, time, buttons)

---

## Zsh

### `/home/drak/.zshrc`
- PATH: ~/.local/bin, ~/.cargo/bin
- EDITOR=nvim, BROWSER=firefox, QT_QPA_PLATFORM=wayland, XDG_CURRENT_DESKTOP=niri
- Aliases: ls=eza, ll, lla, nv, ytm, update, music, etc.
- Gruvbox prompt with username and Git branch, completion and history

---

## Wallpaper (mpvpaper)

### `/home/drak/.local/bin/wallpaper`
- Usage: `wallpaper` or `wallpaper random` (random slideshow), `wallpaper <seconds>`, `wallpaper stop`
- Videos from ~/Wallpapers/live/ (.mp4, .webm, .gif, .mkv), monitor HDMI-A-1, VAAPI, no audio

---

## Discord Rich Presence

### `/home/drak/.config/user-tmpfiles.d/discord-rpc.conf`
- systemd-tmpfiles: symlink Discord Flatpak IPC socket for Rich Presence

---

## Dependencies

### System (Fedora)
- hyprland, waybar, mako, mpvpaper, hyprshot, cava, playerctl, pipewire, wezterm, neovim, zsh, eza, ytermusic, fastfetch, chafa

### Neovim (LazyVim)
- LazyVim/LazyVim, ellisonleao/gruvbox.nvim, andweeb/presence.nvim

### Fonts
- JetBrains Mono, JetBrainsMono Nerd Font, Noto Color Emoji

---

## Gruvbox Colors (reference)

- Background: #282828, #1d2021, #3c3836 | Foreground: #ebdbb2
- Red: #fb4934, #cc241d | Green: #b8bb26, #98971a, #689d6a | Yellow: #fabd2f, #d79921
- Blue: #83a598, #458588 | Purple: #d3869b, #b16286 | Aqua: #8ec07c | Orange: #fe8019 | Gray: #928374, #a89984, #665c54

---

## File Locations

```
~/.config/
  hypr/hyprland.conf
  waybar/{config, style.css, scripts/mediaplayer.sh, scripts/cava.sh}
  wezterm/wezterm.lua
  cava/{config, shaders/}
  mako/config
  fastfetch/{config.jsonc, images/}
  nvim/init.lua, lua/config/{lazy,options,keymaps,autocmds}.lua, lua/plugins/
  user-tmpfiles.d/discord-rpc.conf
~/.local/bin/wallpaper
~/.zshrc
~/.thunderbird/<profile>/chrome/userChrome.css, user.js
```

---

## Useful Commands

- Restart Waybar: `killall waybar && waybar &`
- Wallpaper: `wallpaper` (random), `wallpaper <path>`, `wallpaper stop`
- Screenshots: Print = region, Super+Print = fullscreen

---

Last updated: January 2025 | Fedora, Hyprland, WezTerm, Neovim (LazyVim), Zsh, Gruvbox Dark, JetBrains Mono Nerd Font
