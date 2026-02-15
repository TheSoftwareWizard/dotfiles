# Dotfiles

Hyprland rice — Gruvbox, Waybar, WezTerm, Neovim. Fedora.

---

## ┌─[ HYPRLAND ]──────────────────────────────┐

**hypr/** → `~/.config/hypr/`

| File | Description |
|------|--------------|
| `hyprland.conf` | WM config. Gruvbox, animations, keybinds. Autostart: waybar, mako, hypridle, cliphist, wallpaper. Super+L lock, Super+Shift+R reload, Super+Shift+V clipboard, Super+Shift+E power menu, Super+Shift+W restart waybar. Screenshots: Print / Super+Print. |
| `hyprlock.conf` | Lock screen (Super+L). Gruvbox bg, time/date labels, password field. JetBrains Mono Nerd Font. |
| `hypridle.conf` | Idle daemon. Screen off 5 min, lock 7 min. loginctl + dpms. |

---

## ┌─[ WOFI ]──────────────────────────────────┐

**wofi/** → `~/.config/wofi/`

| File | Description |
|------|--------------|
| `config` | Drun launcher. Width 400, center, dark. |
| `style.css` | Gruvbox. BG #1d2021, selection #689d6a, JetBrains Mono. |

---

## ┌─[ WAYBAR ]────────────────────────────────┐

**waybar/** → `~/.config/waybar/`

| File | Description |
|------|--------------|
| `config` | Modules: workspaces, window, media, cava (braille), CPU, GPU, RAM, volume, network, clock, tray. |
| `style.css` | Gruvbox, JetBrains Mono. No border-radius; thin border on cava only; no hover on active workspace. |
| `style2.css` | Alternate Gruvbox style: icon labels, colored module borders. |
| `scripts/mediaplayer.sh` | playerctl + PipeWire sink-inputs. Icon + artist − title. |
| `scripts/cava.sh` | Cava raw → Unicode bars. Styles: default \| thin \| minimal \| dots \| block \| braille. |
| `scripts/notifications.sh` | Mako: show notification count in waybar. |
| `scripts/show-notifications.sh` | List all notifications in wofi (makoctl list). |
| `custom/mediaplayer.py` | Optional: Python playerctl module for waybar (gi.repository Playerctl). |

---

## ┌─[ WEZTERM ]───────────────────────────────┐

**wezterm/** → `~/.config/wezterm/`

| File | Description |
|------|--------------|
| `wezterm.lua` | Wayland, WebGpu, Gruvbox. JetBrains Mono 9, opacity 0.8. Tab bar bottom, process icons. BlinkingBlock cursor. Ctrl+Shift+D/E split, Ctrl+Shift+Arrow focus, Ctrl+Plus/Minus/0 font size. Scrollback 10k. |

---

## ┌─[ CAVA ]──────────────────────────────────┐

**cava/** → `~/.config/cava/`

| File | Description |
|------|--------------|
| `config` | 60 FPS, 12 bars, Gruvbox gradient, raw ASCII for waybar. PulseAudio, smoothing. |
| `shaders/` | bar_spectrum.frag, northern_lights.frag, pass_through.vert. |

---

## ┌─[ MAKO ]──────────────────────────────────┐

**mako/** → `~/.config/mako/`

| File | Description |
|------|--------------|
| `config` | Gruvbox. Black bg, beige text, yellow border. JetBrains Mono 9. Max 300×100, timeout 5s (10s high urgency), history 1000. |

---

## ┌─[ FASTFETCH ]─────────────────────────────┐

**fastfetch/** → `~/.config/fastfetch/`

| File | Description |
|------|--------------|
| `config.jsonc` | Gruvbox, kitty backend, custom image. Modules: OS, host, CPU, GPU, RAM, disk, packages, shell, terminal, WM, uptime, GitHub. |
| `images/` | Custom ascii/logo images. |

---

## ┌─[ NVIM / LAZYVIM ]────────────────────────┐

**nvim/** → `~/.config/nvim/`

| Path | Description |
|------|--------------|
| `init.lua` | Loads LazyVim via config.lazy. |
| `lua/config/` | lazy, options, keymaps, autocmds. |
| `lua/plugins/` | colorscheme (gruvbox, transparent), discord (presence.nvim). |

---

## ┌─[ ZSH ]───────────────────────────────────┐

**zshrc** → `~/.zshrc`

PATH ~/.local/bin, ~/.cargo/bin. EDITOR=nvim, QT_QPA_PLATFORM=wayland. Aliases: eza, nv, ytm, update, music. Gruvbox prompt, git branch, completion, history.

---

## ┌─[ LOCAL BIN ]─────────────────────────────┐

**local/bin/** → `~/.local/bin/`

| Script | Description | Bind |
|--------|-------------|------|
| `wallpaper` | mpvpaper slideshow. hwdec=vaapi, 30fps, cache 2s / 24MiB. Playlist capped at 20. `wallpaper` \| `wallpaper random` \| `wallpaper <sec>` \| `wallpaper stop`. | — |
| `restart-waybar` | Restart waybar (nohup, survives terminal close). | Super+Shift+W |
| `clipboard-pick` | Clipboard history via wofi (cliphist). Needs: cliphist, wl-clipboard. Autostart: wl-paste --watch cliphist store. | Super+Shift+V |
| `power-menu` | Lock, Log out, Reboot, Shutdown. | Super+Shift+E |

---

## ┌─[ GTK ]───────────────────────────────────┐

**gtk-3.0/** → `~/.config/gtk-3.0/`  
**gtk-4.0/** → `~/.config/gtk-4.0/`

settings.ini: JetBrains Mono 10, dark preferred, cursor Adwaita 24. gtk-3.0 may also have gtk.css (Gruvbox overrides; not always in repo).

---

## ┌─[ USER-TMPFILES ]─────────────────────────┐

**user-tmpfiles.d/** → `~/.config/user-tmpfiles.d/`

discord-rpc.conf: systemd-tmpfiles symlink for Discord Flatpak IPC (Rich Presence).

---

## ┌─[ DEPENDENCIES ]──────────────────────────┐

**System (Fedora)**  
hyprland, hyprlock, hypridle, waybar, mako, wofi, mpvpaper, hyprshot, cava, playerctl, pipewire, wezterm, neovim, zsh, eza, ytermusic, fastfetch, chafa, cliphist, wl-clipboard.

**Fonts**  
JetBrains Mono, JetBrainsMono Nerd Font, Noto Color Emoji.

**Neovim**  
LazyVim, gruvbox.nvim, presence.nvim.

---

## ┌─[ REPO LAYOUT ]──────────────────────────┐

```
dotfiles/
├── cava/
├── fastfetch/
├── gtk-3.0/
├── gtk-4.0/
├── hypr/
├── local/bin/
├── mako/
├── nvim/
├── user-tmpfiles.d/
├── waybar/
├── wezterm/
├── wofi/
├── zshrc
└── README.md
```

Deploy with GNU stow from parent dir: `stow -t ~ dotfiles` (or per-directory). Link `zshrc` to `~/.zshrc` as needed.

---

## ┌─[ COMMANDS ]──────────────────────────────┐

| Action | Key / Command |
|--------|----------------|
| Lock | Super+L |
| Reload hyprland | Super+Shift+R or `hyprctl reload` |
| Restart waybar | Super+Shift+W or `restart-waybar` |
| Clipboard history | Super+Shift+V |
| Power menu | Super+Shift+E |
| Wallpaper | `wallpaper`, `wallpaper random`, `wallpaper stop` |
| Screenshots | Print = region, Super+Print = fullscreen |

---

## ┌─[ GRUVBOX REF ]───────────────────────────┐

BG #282828 #1d2021 #3c3836 · FG #ebdbb2 · Red #fb4934 #cc241d · Green #b8bb26 #689d6a · Yellow #fabd2f #d79921 · Blue #83a598 · Purple #d3869b #b16286 · Aqua #8ec07c · Orange #fe8019 · Gray #928374 #a89984
