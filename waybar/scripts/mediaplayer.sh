#!/bin/bash
# ┌─[ MEDIAPLAYER ]────────────────────────────┐

MAX_LENGTH=25

get_audio_apps() {
    pactl list sink-inputs 2>/dev/null | grep -E "application.name|media.name|state:" | \
    awk '/state: RUNNING/{getline; if(/application.name/) print}' | \
    sed 's/.*= "//' | sed 's/"$//' | head -1
}

player=$(playerctl -l 2>/dev/null | head -1)

if [ -n "$player" ]; then
    status=$(playerctl -p "$player" status 2>/dev/null)
    
    if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
        artist=$(playerctl -p "$player" metadata artist 2>/dev/null)
        title=$(playerctl -p "$player" metadata title 2>/dev/null)
        
        if [ -n "$artist" ] && [ -n "$title" ]; then
            text="$artist - $title"
        elif [ -n "$title" ]; then
            text="$title"
        else
            text=$(echo "$player" | sed 's/\.[0-9]*$//' | sed 's/chromium/Chrome/' | sed 's/firefox/Firefox/' | sed 's/spotify/Spotify/')
        fi
        
        if [ ${#text} -gt $MAX_LENGTH ]; then
            text="${text:0:$((MAX_LENGTH-3))}..."
        fi
        
        if [ "$status" = "Playing" ]; then
            icon="󰐊"
        else
            icon="󰏤"
        fi
        
        echo "$icon $text"
        exit 0
    fi
fi

audio_app=$(pactl list sink-inputs 2>/dev/null | grep -A 20 "state: RUNNING" | grep "application.name" | head -1 | sed 's/.*= "//' | sed 's/"$//')

if [ -n "$audio_app" ]; then
    case "$audio_app" in
        *[Dd]iscord*)
            text="Discord"
            icon="󰙯"
            ;;
        *[Ff]irefox*)
            text="Firefox"
            icon="󰈹"
            ;;
        *[Cc]hrome*|*[Cc]hromium*)
            text="Chrome"
            icon=""
            ;;
        *[Ss]potify*)
            text="Spotify"
            icon=""
            ;;
        *[Ss]team*)
            text="Steam"
            icon="󰓓"
            ;;
        *[Vv]lc*)
            text="VLC"
            icon="󰕼"
            ;;
        *[Mm]pv*)
            text="mpv"
            icon=""
            ;;
        *WEBRTC*)
            text="Voice Call"
            icon="󰍬"
            ;;
        *)
            text="$audio_app"
            icon="󰓃"
            ;;
    esac
    
    if [ ${#text} -gt $MAX_LENGTH ]; then
        text="${text:0:$((MAX_LENGTH-3))}..."
    fi
    
    echo "$icon $text"
    exit 0
fi

echo ""
