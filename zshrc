# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#  ┬  ┬┌─┐┬─┐┌─┐
#  └┐┌┘├─┤├┬┘└─┐
#   └┘ ┴ ┴┴└─└─┘
export EDITOR='nvim'
export VISUAL="${EDITOR}"
export BROWSER='firefox'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export SUDO_PROMPT="Deploying root access for %u. Password pls: "
export BAT_THEME="base16"
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=niri

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Cargo (Rust) binaries
if [ -d "$HOME/.cargo/bin" ] ;
  then PATH="$HOME/.cargo/bin:$PATH"
fi

#  ┬  ┌─┐┌─┐┌┬┐  ┌─┐┌┐┌┌─┐┬┌┐┌┌─┐
#  │  │ │├─┤ ││  ├┤ ││││ ┬││││├┤
#  ┴─┘└─┘┴ ┴─┴┘  └─┘┘└┘└─┘┴┘└┘└─┘
autoload -Uz compinit

if [[ ! -f ~/.config/zsh/zcompdump || ~/.config/zsh/zcompdump -ot ~/.zshrc ]]; then
  compinit -d ~/.config/zsh/zcompdump
else
  compinit -C -d ~/.config/zsh/zcompdump
fi

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;197;1'
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{142}󰊢%f %F{214}%b%f'
zstyle ':vcs_info:git:*' actionformats ' %F{142}󰊢%f %F{214}%b%f %F{red}%a%f'

# Aliases
alias ls='eza'
alias ll='eza -l'
alias lla='eza -la'
alias nv='nvim'
alias ytm='ytermusic'
alias cp='cp -i'
alias sd="cd ~ && cd \$(find * -type d | fzf)"
alias cpdf="pdflatex -shell-escape book.tex ; zathura book.pdf & disown"

# Fedora update alias
alias update="sudo dnf upgrade"
alias grub-update="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"

alias music="ncmpcpp"

autoload -U colors && colors
setopt PROMPT_SUBST

git_status() {
    local branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        local status=$(git status --porcelain 2>/dev/null)
        if [ -n "$status" ]; then
            echo " %F{142}󰊢%f %F{214}$branch%f %F{red}●%f"
        else
            echo " %F{142}󰊢%f %F{214}$branch%f"
        fi
    fi
}

PROMPT='%F{142}%n%f %F{214}%~%f$(git_status) %F{142}>%f '
